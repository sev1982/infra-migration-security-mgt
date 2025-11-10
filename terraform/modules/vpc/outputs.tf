output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "nat_gateway_id" {
  value = var.enable_nat_gateway ? aws_nat_gateway.natgw[0].id : null
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web-server.public_ip
}

output "web_url" {
  description = "Website URL"
  value       = "http://${aws_instance.web-server.public_dns}"
}

output "s3_bucket_name" {
  description = "Terraform state S3 bucket name"
  value       = aws_s3_bucket.tf_state.bucket
}