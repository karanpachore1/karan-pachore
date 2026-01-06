terraform {
  backend "s3" {
    bucket = "tf-bucketkp"
    region = "ap-south-1"
    key = "tfstate"
  }
}

provider "aws" {
    region = "var.region"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  az_public            = "ap-south-1a"
  az_private           = "ap-south-1b"
  project              = var.project
}

module "Ec2" {
  source = "./modules/Ec2"

  ami             = var.ami
  instance_type   = var.instance_type
  key_pair        = var.key_pair
  subnet_id       = module.vpc.public_subnet_id
  project         = var.project
}
