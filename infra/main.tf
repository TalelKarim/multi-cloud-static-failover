data "aws_route53_zone" "root" {
  name         = var.root_domain_name
  private_zone = false
}

data "azurerm_client_config" "current" {}



# AWS Static Site Module

module "aws_static_site" {
  source = "./modules/aws_static_site"

  project_name = var.project_name
  environment  = var.environment
  tags         = local.common_tags
}


# Azure Static Site Module

module "azure_static_site" {
  source = "./modules/azure_static_site"

  project_name   = var.project_name
  environment    = var.environment
  azure_location = var.azure_location

  tags = local.common_tags
}



# Route 53 Failover Module


module "route53_failover" {
  source = "./modules/route53_failover"

  hosted_zone_id  = data.aws_route53_zone.root.zone_id
  app_domain_name = var.app_domain_name

  primary_dns_name = module.aws_static_site.cloudfront_domain_name

  secondary_dns_name = trimsuffix(
    replace(module.azure_static_site.static_website_url, "https://", ""),
    "/"
  )

  health_check_fqdn = module.aws_static_site.cloudfront_domain_name
  health_check_path = "/"

  tags = local.common_tags
}