variable "table_name" {
  type        = string
  description = "Nom de la table DynamoDB utilisée pour le lock Terraform."
}

variable "env" {
  type        = string
  description = "Environnement (dev/staging/prod)."
}
