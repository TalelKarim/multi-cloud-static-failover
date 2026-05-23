resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.azure_location

  tags = var.tags
}


resource "azurerm_storage_account" "this" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_account_static_website" "this" {
  storage_account_id = azurerm_storage_account.this.id

  index_document     = "index.html"
  error_404_document = "index.html"
}