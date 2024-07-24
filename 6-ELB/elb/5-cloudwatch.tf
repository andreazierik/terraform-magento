resource "aws_cloudwatch_metric_alarm" "alarm-cpu-bigger-than-limit" {
  alarm_name                = "cpu-bigger-than-limit"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 3
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 10
  statistic                 = "Average"
  threshold                 = 70
  alarm_description         = "Uso da CPU maior que o limite."
  
  # dimensions = {
  #   LoadBalancer = aws_lb.alb-1.arn_suffix
  # }

  dimensions = {
    AutoScaling = aws_autoscaling_group.asg-alb-1.arn
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm-cpu-lower-than-limit" {
  alarm_name                = "cpu-lower-than-limit"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 30
  alarm_description         = "Uso da CPU menor que o limite."
  insufficient_data_actions = []
}