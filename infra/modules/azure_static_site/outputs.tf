output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "static_website_url" {
  value = azurerm_storage_account.this.primary_web_endpoint
}

