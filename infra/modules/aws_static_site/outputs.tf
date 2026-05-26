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


# Output the ARN of the IAM role for GitHub Actions deployment

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions_deploy.arn
}