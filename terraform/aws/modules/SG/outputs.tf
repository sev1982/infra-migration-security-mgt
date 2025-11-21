output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "instances_sg_id" {
  value = aws_security_group.instances.id
}
