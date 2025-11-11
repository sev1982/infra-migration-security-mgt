# ----------------------------
# KMS Key for S3 Encryption
# ----------------------------
resource "aws_kms_key" "terraform_state_key" {
  description             = "KMS key for Terraform state encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_s3_enc" {
  bucket = "infra-migration-tfstate-8b39bb45"

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.terraform_state_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
