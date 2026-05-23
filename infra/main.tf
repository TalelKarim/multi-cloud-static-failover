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