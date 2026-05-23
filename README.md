# Multi-Cloud Static Failover

AWS + Azure static website failover using Terraform Cloud, Route 53, CloudFront, Azure Front Door, and Azure Storage Static Website.

## Target Architecture

User → Route 53 Failover → AWS CloudFront/S3 primary or Azure Front Door/Storage secondary.

## Project Structure

- `app/` - single frontend application
- `infra/` - Terraform root module
- `infra/modules/aws_static_site/` - AWS primary hosting
- `infra/modules/azure_static_site/` - Azure secondary hosting
- `infra/modules/route53_failover/` - Route 53 DNS failover
- `.github/workflows/` - CI/CD workflows
- `docs/` - architecture and design documentation
# multi-cloud-static-failover


