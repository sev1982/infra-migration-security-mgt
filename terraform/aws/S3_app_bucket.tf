# ----------------------------
# Random ID (for unique name)
# ----------------------------
resource "random_id" "app_bucket_suffix" {
  byte_length = 4
}

# ----------------------------
# S3 Bucket for Application Data
# ----------------------------
resource "aws_s3_bucket" "app_data" {
  bucket        = "infra-migration-app-${random_id.app_bucket_suffix.hex}"
  force_destroy = false # ne pas supprimer s'il contient des fichiers

  lifecycle {
    prevent_destroy = true # empêche Terraform de le détruire même si on fait terraform destroy
  }

  tags = {
    Name        = "infra-migration-app-bucket"
    Environment = "dev"
  }
}

# ----------------------------
# Enable Versioning
# ----------------------------
resource "aws_s3_bucket_versioning" "app_data_versioning" {
  bucket = aws_s3_bucket.app_data.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ----------------------------
# Server-side Encryption
# ----------------------------
resource "aws_s3_bucket_server_side_encryption_configuration" "app_data_enc" {
  bucket = aws_s3_bucket.app_data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ----------------------------
# Block Public Access
# ----------------------------
resource "aws_s3_bucket_public_access_block" "app_data_block" {
  bucket = aws_s3_bucket.app_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "app_data_bucket_name" {
  value = aws_s3_bucket.app_data.bucket
}