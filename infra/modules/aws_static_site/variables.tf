variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "app_domain_name" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}