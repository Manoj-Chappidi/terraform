provider "aws" {
  region = "us-east-1"  
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source            = "./modules/ec2"
  private_subnets   = module.vpc.private_subnets_ids
}

module "route53" {
  source           = "./modules/route53"
  nat_gateway_ip   = module.vpc.nat_gateway_ip
}

