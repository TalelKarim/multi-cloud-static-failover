output "bucket_name" {
  value = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_hosted_zone_id" {
  value = aws_cloudfront_distribution.site.hosted_zone_id
}

output "aws_primary_bucket_name" {
  value = module.aws_static_site.bucket_name
}

output "aws_cloudfront_distribution_id" {
  value = module.aws_static_site.cloudfront_distribution_id
}

output "aws_cloudfront_domain_name" {
  value = module.aws_static_site.cloudfront_domain_name
}