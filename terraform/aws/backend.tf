# ----------------------------
# S3 Bucket for Terraform State
# ----------------------------
resource "aws_s3_bucket" "tf_state" {
  bucket = "infra-migration-tfstate-${random_id.bucket_id.hex}"

  tags = {
    Name = "infra-migration-tfstate"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
