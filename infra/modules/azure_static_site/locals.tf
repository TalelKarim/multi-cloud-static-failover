locals {
  resource_group_name = "rg-${var.project_name}-${var.environment}"

  storage_account_name = replace(
    substr("${var.project_name}${var.environment}azure", 0, 24),
    "-",
    ""
  )

  storage_static_website_host = trimsuffix(
    replace(azurerm_storage_account.this.primary_web_endpoint, "https://", ""),
    "/"
  )
}