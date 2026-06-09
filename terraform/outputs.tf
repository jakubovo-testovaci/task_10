output "ecr_repo_url" {
  description = "URL of ECR repositary"
  value       = aws_ecr_repository.mynginx.repository_url
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.main.dns_name
}

output "load_balancer_url" {
  description = "URL of the load balancer"
  value       = "http://${aws_lb.main.dns_name}"
}

output "cloudwatch_dashboard_url" {
  description = "URL of the cloudwatch dashboard"
  value       = "https://${var.aws_region}.console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards/dashboard/ecs-nginx"
}
