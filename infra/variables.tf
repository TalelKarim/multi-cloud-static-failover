variable "project_name" {
  type        = string
  description = "Project name."
  default     = "multi-cloud-static-failover"
}

variable "environment" {
  type        = string
  description = "Environment name."
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "AWS region."
  default     = "eu-west-3"
}

variable "azure_location" {
  type        = string
  description = "Azure region."
  default     = "westeurope"
}

variable "root_domain_name" {
  type        = string
  description = "Existing public hosted zone root domain."
  default     = "talelkarimchebbi.com"
}

variable "app_domain_name" {
  type        = string
  description = "Application FQDN."
  default     = "multi-cloud.talelkarimchebbi.com"
}
