terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source = "../../modules/vpc"
  
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
  environment         = var.environment
}

# EC2 Kubernetes Cluster Module
module "k8s_cluster" {
  source = "../../modules/kubernetes"
  
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  instance_type       = var.k8s_instance_type
  key_name            = var.key_name
  environment         = var.environment
}

# RDS Module (Free Tier)
module "rds" {
  source = "../../modules/rds"
  
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  db_instance_class   = "db.t3.micro"  # Free tier eligible
  allocated_storage   = 20              # Free tier: up to 20GB
  engine              = "postgres"
  engine_version      = "14.7"
  database_name       = var.db_name
  master_username     = var.db_username
  master_password     = var.db_password
  environment         = var.environment
}
