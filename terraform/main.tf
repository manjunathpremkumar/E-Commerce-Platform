terraform {
  required_version = ">= 1.5.0"
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

module "login_service" {
  source = "./modules/login-service"

  environment     = var.environment
  service_name    = "login-service"
  replica_count   = var.login_replica_count
  cpu_request     = var.login_cpu_request
  memory_request  = var.login_memory_request
  vpc_id          = var.vpc_id
  private_subnets = var.private_subnets
}

module "payment_service" {
  source = "./modules/login-service"

  environment     = var.environment
  service_name    = "payment-service"
  replica_count   = 3
  cpu_request     = "1000m"
  memory_request  = "2Gi"
  vpc_id          = var.vpc_id
  private_subnets = var.private_subnets
}
