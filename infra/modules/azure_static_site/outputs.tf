output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "static_website_url" {
  value = azurerm_storage_account.this.primary_web_endpoint
}



output "frontdoor_profile_name" {
  value = azurerm_cdn_frontdoor_profile.this.name
}

output "frontdoor_endpoint_name" {
  value = azurerm_cdn_frontdoor_endpoint.this.name
}

output "frontdoor_endpoint_host_name" {
  value = azurerm_cdn_frontdoor_endpoint.this.host_name
}

output "frontdoor_url" {
  value = "https://${azurerm_cdn_frontdoor_endpoint.this.host_name}"
}