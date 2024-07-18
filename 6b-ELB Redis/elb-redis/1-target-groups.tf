// Target group
resource "aws_lb_target_group" "tgrp-1-nlb-1" {  

  name     = "tgrp-1-nlb-${var.shortnameid}-1"
  port     = 6379
  protocol = "TCP"
  vpc_id   = data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-id

  health_check {
    enabled             = true
    protocol            = "TCP"    
    port                = 6379
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3    
  }

  deregistration_delay = 15

  tags = {
    Name = "tgrp-redis-master-1-nlb-${var.shortnameid}-1"
  }
}

resource "aws_lb_target_group" "tgrp-1-nlb-2" {  

  name     = "tgrp-1-nlb-${var.shortnameid}-2"
  port     = 6379
  protocol = "TCP"
  vpc_id   = data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-id

  health_check {
    enabled             = true
    protocol            = "TCP"    
    port                = 6379
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3    
  }

  deregistration_delay = 15

  tags = {
    Name = "tgrp-redis-replica-1-nlb-${var.shortnameid}-2"
  }
}