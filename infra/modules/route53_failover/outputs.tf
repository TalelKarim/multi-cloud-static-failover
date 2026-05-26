output "health_check_id" {
  value = aws_route53_health_check.primary.id
}

output "failover_fqdn" {
  value = var.app_domain_name
}