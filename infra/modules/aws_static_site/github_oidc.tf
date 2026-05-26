data "aws_iam_policy_document" "github_actions_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        "repo:TON_GITHUB_USER/multi-cloud-static-failover:ref:refs/heads/main"
      ]
    }
  }
}


data "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
}


resource "aws_iam_role" "github_actions_deploy" {
  name               = "${var.project_name}-${var.environment}-github-actions-deploy"
  assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role.json

  tags = var.tags
}

data "aws_iam_policy_document" "github_actions_deploy" {
  statement {
    sid    = "ListBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.site.arn
    ]
  }

  statement {
    sid    = "WriteObjects"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.site.arn}/*"
    ]
  }

  statement {
    sid    = "InvalidateCloudFront"
    effect = "Allow"

    actions = [
      "cloudfront:CreateInvalidation"
    ]

    resources = [
      aws_cloudfront_distribution.site.arn
    ]
  }
}

resource "aws_iam_policy" "github_actions_deploy" {
  name   = "${var.project_name}-${var.environment}-github-actions-deploy"
  policy = data.aws_iam_policy_document.github_actions_deploy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "github_actions_deploy" {
  role       = aws_iam_role.github_actions_deploy.name
  policy_arn = aws_iam_policy.github_actions_deploy.arn
}