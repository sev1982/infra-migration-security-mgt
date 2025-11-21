#########################################
#           PROVIDERS
#########################################
/*
terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  #backend "s3" {}

}

provider "aws" {
  region = var.region
}


#########################################
#          MODULE VPC
#########################################

module "vpc" {
  source     = "./modules/vpc"
  env        = var.env
  cidr_block = var.vpc_cidr
  azs        = var.azs
}


#########################################
#           MODULE S3 (APP DATA)
#########################################

module "s3_app" {
  source      = "./modules/s3"
  bucket_name = var.app_bucket_name
  env         = var.env
}


#########################################
#           MODULE KMS
#########################################

module "kms" {
  source   = "./modules/kms"
  app_name = var.project_name
}


#########################################
#           MODULE IAM
#########################################

module "iam" {
  source    = "./modules/iam"
  role_name = "${var.project_name}-${var.env}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}



#########################################
#           MODULE EC2
#########################################

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnets[0]
 
  }
}


#########################################
#           MODULE ALB
#########################################

module "alb" {
  source         = "./modules/alb"
  app_name       = var.project_name
  public_subnets = module.vpc.public_subnets
}
*/

module "vpc" {
  source     = "./modules/vpc"
  env        = var.env
  cidr_block = var.cidr_block
  azs        = var.azs
}

module "sg" {
  source = "./modules/sg"
  env    = var.env
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  env            = var.env
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg_id      = module.sg.alb_sg_id
}

module "asg" {
  source              = "./modules/asg"
  env                 = var.env
  private_subnets     = module.vpc.private_subnets
  instances_sg_id     = module.sg.instances_sg_id
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  alb_target_group_arn = module.alb.target_group_arn
}
