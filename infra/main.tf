data "aws_route53_zone" "root" {
  name         = var.root_domain_name
  private_zone = false
}

data "azurerm_client_config" "current" {}



# AWS Static Site Module

module "aws_static_site" {
  source = "./modules/aws_static_site"

  providers = {
    aws           = aws
    aws.us_east_1 = aws.us_east_1
  }

  project_name    = var.project_name
  environment     = var.environment
  app_domain_name = var.app_domain_name
  hosted_zone_id  = data.aws_route53_zone.root.zone_id
  tags            = local.common_tags
}
# Azure Static Site Module

module "azure_static_site" {
  source = "./modules/azure_static_site"

  project_name       = var.project_name
  environment        = var.environment
  azure_location     = var.azure_location
  custom_domain_name = var.app_domain_name

  tags = local.common_tags
}



# Route 53 Failover Module


module "route53_failover" {
  source = "./modules/route53_failover"

  hosted_zone_id  = data.aws_route53_zone.root.zone_id
  app_domain_name = var.app_domain_name

  primary_dns_name = module.aws_static_site.cloudfront_domain_name

  secondary_dns_name = module.azure_static_site.frontdoor_endpoint_host_name

  health_check_fqdn = module.aws_static_site.cloudfront_domain_name
  health_check_path = "/"

  tags = local.common_tags

  depends_on = [
    aws_route53_record.azure_frontdoor_custom_domain_validation
  ]
}



# Validation record for Azure Front Door custom domain
resource "aws_route53_record" "azure_frontdoor_custom_domain_validation" {
  zone_id = data.aws_route53_zone.root.zone_id
  name    = "_dnsauth.${var.app_domain_name}"
  type    = "TXT"
  ttl     = 60

  records = [
    module.azure_static_site.frontdoor_custom_domain_validation_token
  ]
}