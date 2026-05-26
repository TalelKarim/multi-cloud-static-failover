variable "hosted_zone_id" {
  type = string
}

variable "app_domain_name" {
  type = string
}

variable "primary_dns_name" {
  type = string
}

variable "secondary_dns_name" {
  type = string
}

variable "health_check_fqdn" {
  type = string
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "tags" {
  type = map(string)
}