#########################################
#             OUTPUTS AWS
#########################################

output "vpc_id" {
  description = "ID du VPC créé"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Liste des subnets publics"
  value       = module.vpc.public_subnets
}

output "alb_dns" {
  description = "Nom DNS du load balancer ALB"
  value       = module.alb.alb_dns
}
