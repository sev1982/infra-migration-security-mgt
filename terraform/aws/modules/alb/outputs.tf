output "alb_dns" {
  value = aws_lb.application.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

