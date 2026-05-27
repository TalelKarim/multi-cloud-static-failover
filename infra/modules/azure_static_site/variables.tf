variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "azure_location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "custom_domain_name" {
  type        = string
  description = "Custom domain used by Azure Front Door."
}