variable "bucket_name" {
  type        = string
  description = "Nom du bucket utilisé pour stocker le Terraform state."
}

variable "env" {
  type        = string
  description = "Environnement (dev/staging/prod)."
}

variable "kms_key_arn" {
  type        = string
  description = "ARN de la clé KMS utilisée pour chiffrer le bucket."
}
