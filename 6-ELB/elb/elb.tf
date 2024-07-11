// Target group
resource "aws_lb_target_group" "tgrp-alb-1" {
  name     = "tgrp-alb-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-id

  # stickiness {
  #   type            = "lb_cookie"
  #   cookie_duration = 3600
  # }

  health_check {
    enabled             = true
    protocol            = "HTTP"    
    port                = 80
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher = "200-404"
  }  

  deregistration_delay = 15
}

// Application Load balancer
resource "aws_lb" "alb-1" {
  name               = "alb-1"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-sg-alb-id
  ]
  subnets = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-subnet-public-1a-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-subnet-public-1b-id
  ]

  enable_deletion_protection = false

  tags = {
    Name        = "alb-1"
    Environment = "production"
  }
}

// Load balancer listeners
resource "aws_lb_listener" "listener-http-alb-1" {
  load_balancer_arn = aws_lb.alb-1.arn
  port              = "80"
  protocol          = "HTTP"

  # default_action {    
  #   type             = "forward"
  #   target_group_arn = aws_lb_target_group.tgrp-alb-1.arn  
  # }
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_302"
    }
  }
}

resource "aws_lb_listener" "listener-https-alb-1" {
  load_balancer_arn = aws_lb.alb-1.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = data.terraform_remote_state.remote-ssl-certificate.outputs.acm-acm-odoo-certificate-arn

  default_action {    
    type             = "forward"
    target_group_arn = aws_lb_target_group.tgrp-alb-1.arn  
  }
}

// Auto-scaling
resource "aws_autoscaling_group" "asg-alb-1" {

  // Group Details
  #capacity_rebalance = true
  capacity_rebalance = false
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  lifecycle {
    create_before_destroy = true
  }

  // Launch template
  launch_template {
    id      = aws_launch_template.ltplt-1.id
    version = "$Latest"
  }

  // Network
  vpc_zone_identifier = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-subnet-private-1a-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-subnet-private-1b-id
  ]    

  // Load balancing
  target_group_arns = [
    aws_lb_target_group.tgrp-alb-1.arn
  ]

  // Health checks
  health_check_type = "ELB"
  health_check_grace_period = 60

  // Advanced configuration
  default_cooldown = 180

  // Metrics
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  metrics_granularity = "1Minute"
  
}