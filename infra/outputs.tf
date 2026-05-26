output "root_hosted_zone_id" {
  description = "Existing Route 53 hosted zone ID."
  value       = data.aws_route53_zone.root.zone_id
}

output "app_domain_name" {
  description = "Application domain name."
  value       = var.app_domain_name
}

output "azure_client_id" {
  value = data.azurerm_client_config.current.client_id
}


output "aws_primary_bucket_name" {
  value = module.aws_static_site.bucket_name
}

output "aws_cloudfront_distribution_id" {
  value = module.aws_static_site.cloudfront_distribution_id
}

output "aws_cloudfront_domain_name" {
  value = module.aws_static_site.cloudfront_domain_name
}


output "azure_resource_group_name" {
  value = module.azure_static_site.resource_group_name
}

output "azure_storage_account_name" {
  value = module.azure_static_site.storage_account_name
}

output "azure_static_website_url" {
  value = module.azure_static_site.static_website_url
}


output "aws_bucket_name" {
  value = module.aws_static_site.bucket_name
}



output "aws_github_actions_role_arn" {
  value = module.aws_static_site.github_actions_role_arn
}




# Route 53 Failover Outputs

output "route53_failover_fqdn" {
  value = module.route53_failover.failover_fqdn
}

output "route53_primary_health_check_id" {
  value = module.route53_failover.health_check_id
}