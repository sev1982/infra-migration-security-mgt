# ----------------------------
# IAM Policy for Terraform S3 Access
# ----------------------------
resource "aws_iam_policy" "s3_read_policy" {
  name        = "TerraformStateS3AccessPolicy"
  description = "Allow Terraform to manage S3 state bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource : "arn:aws:s3:::infra-migration-tfstate-8b39bb45"
      }
    ]
  })
}
