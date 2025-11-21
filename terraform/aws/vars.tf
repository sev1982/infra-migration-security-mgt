/*
#############################################
#        VARIABLES GLOBALES (root module)
#############################################

variable "env" {
  description = "Environnement cible (dev ou prod)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
}

#############################################
#                VPC
#############################################

variable "vpc_cidr" {
  description = "CIDR block de la VPC"
  type        = string
}

variable "azs" {
  description = "Liste des zones de disponibilité"
  type        = list(string)
}

#############################################
#                EC2
#############################################

variable "ami_id" {
  description = "ID de l'AMI EC2"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
}

variable "key_name" {
  description = "Nom de la clé SSH"
  type        = string
}

#############################################
#                S3
#############################################

variable "app_bucket_name" {
  description = "Nom du bucket applicatif"
  type        = string
}

#############################################
#                IAM
#############################################

variable "assume_role_policy" {
  description = "JSON policy pour AssumeRole"
  type        = string
}
variable "bucket_name" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

variable "dynamodb_table" {
  description = "Nom de la table DynamoDB utilisée pour le verrouillage du backend"
  type        = string
}
*/

variable "env" { type = string }
variable "cidr_block" { type = string }
variable "azs" { type = list(string) }
variable "ami_id" { type = string }
variable "instance_type" { type = string }
