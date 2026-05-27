output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "static_website_url" {
  value = azurerm_storage_account.this.primary_web_endpoint
}



# Azure front door outputs
output "frontdoor_endpoint_host_name" {
  value = azurerm_cdn_frontdoor_endpoint.this.host_name
}

output "frontdoor_custom_domain_validation_token" {
  value = azurerm_cdn_frontdoor_custom_domain.this.validation_token
}

output "frontdoor_url" {
  value = "https://${azurerm_cdn_frontdoor_endpoint.this.host_name}"
}