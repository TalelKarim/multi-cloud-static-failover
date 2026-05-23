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





ARM_SUBSCRIPTION_ID=d35044fb-0834-4f7d-8611-3c4aacfcf623
ARM_TENANT_ID=94506813-9871-4526-87ca-c8cfcc5958a0
ARM_CLIENT_ID=0caf28b3-b64a-46d5-b93f-ad9f009f98b8
ARM_CLIENT_SECRET=W8K8Q~Q8UgAOy2kwxX1KvF21bHI-rP8x34_A1dze