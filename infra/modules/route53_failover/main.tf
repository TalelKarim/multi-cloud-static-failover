resource "aws_route53_health_check" "primary" {
  fqdn              = var.health_check_fqdn
  port              = 443
  type              = "HTTPS"
  resource_path     = var.health_check_path
  failure_threshold = 3
  request_interval  = 30

  tags = merge(var.tags, {
    Name = "${var.app_domain_name}-primary-health-check"
  })
}

resource "aws_route53_record" "primary" {
  zone_id = var.hosted_zone_id
  name    = var.app_domain_name
  type    = "CNAME"
  ttl     = 60

  set_identifier = "aws-primary"

  failover_routing_policy {
    type = "PRIMARY"
  }

  health_check_id = aws_route53_health_check.primary.id

  records = [
    var.primary_dns_name
  ]
}

resource "aws_route53_record" "secondary" {
  zone_id = var.hosted_zone_id
  name    = var.app_domain_name
  type    = "CNAME"
  ttl     = 60

  set_identifier = "azure-secondary"

  failover_routing_policy {
    type = "SECONDARY"
  }

  records = [
    var.secondary_dns_name
  ]
}