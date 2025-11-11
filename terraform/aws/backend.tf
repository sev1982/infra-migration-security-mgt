terraform {
  backend "s3" {
    bucket         = "infra-migration-tfstate-8b39bb45" # Remplace par ton nom généré
    key            = "aws/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
