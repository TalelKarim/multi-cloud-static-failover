output "root_hosted_zone_id" {
  description = "Existing Route 53 hosted zone ID."
  value       = data.aws_route53_zone.root.zone_id
}

output "app_domain_name" {
  description = "Application domain name."
  value       = var.app_domain_name
}