resource "aws_s3_bucket" "app_data" {
  bucket = var.bucket_name

  tags = {
    Name = "${var.env}-app-data"
    Env  = var.env
  }
}
