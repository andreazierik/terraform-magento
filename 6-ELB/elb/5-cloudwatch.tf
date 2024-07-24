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
    AutoScalingGroupName = aws_autoscaling_group.asg-alb-1.name
  }

  alarm_actions = [
    aws_autoscaling_policy.cpu-limit-add-instance.arn
  ]
}

resource "aws_cloudwatch_metric_alarm" "alarm-cpu-lower-than-limit" {
  alarm_name                = "cpu-lower-than-limit"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 30
  alarm_description         = "Uso da CPU menor que o limite."  

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-alb-1.name
  }

  alarm_actions = [
    aws_autoscaling_policy.cpu-limit-remove-instance.arn
  ]
}

resource "aws_cloudwatch_dashboard" "dashboard-1" {
  dashboard_name = "Magento-Dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 3
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "AutoScalingGroupName",
              aws_autoscaling_group.asg-alb-1.name
            ]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "Auto Scaling Group - CPU Utilization"
        }
      },
      {
        type   = "text"
        x      = 0
        y      = 0
        width  = 3
        height = 3

        properties = {
          markdown = "Magento Dashboard"
        }
      }
    ]
  })
}