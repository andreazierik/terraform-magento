// Auto-scaling
resource "aws_autoscaling_group" "asg-alb-1" {

  // Group Details  
  capacity_rebalance = true
  desired_capacity   = 1
  max_size           = 2
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
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1a-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1b-id
  ]

  // Load balancing
  target_group_arns = [
    aws_lb_target_group.tgrp-1-alb-1.arn
  ]

  // Health checks
  # health_check_type         = "ELB"
  health_check_type         = "EC2"
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