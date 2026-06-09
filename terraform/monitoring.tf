resource "aws_cloudwatch_dashboard" "ecs_nginx" {
  dashboard_name = "ecs-nginx"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title  = "ECS CPU Utilization"
          view   = "timeSeries"
          region = var.aws_region
          stat   = "Average"

          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName",
              aws_ecs_cluster.main.name,
              "ServiceName",
              aws_ecs_service.nginx.name
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title  = "ECS Memory Utilization"
          view   = "timeSeries"
          region = var.aws_region
          stat   = "Average"

          metrics = [
            [
              "AWS/ECS",
              "MemoryUtilization",
              "ClusterName",
              aws_ecs_cluster.main.name,
              "ServiceName",
              aws_ecs_service.nginx.name
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 24
        height = 6

        properties = {
          title  = "Successful Pages (HTTP 200)"
          view   = "timeSeries"
          region = var.aws_region
          stat   = "Sum"

          metrics = [
            [
              "Custom/Nginx",
              "NginxHttp200"
            ]
          ]
        }
      }
    ]
  })
}

resource "aws_cloudwatch_log_metric_filter" "nginx_http_200" {
  name           = "nginx-http-200"
  log_group_name = aws_cloudwatch_log_group.nginx.name

  pattern = "{ $.status = 200 }"

  metric_transformation {
    name      = "NginxHttp200"
    namespace = "Custom/Nginx"
    value     = "1"
  }
}