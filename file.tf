terraform {
  backend "s3" {
  bucket = "tf-bucketkp"
  region = "ap-south-1"
  key = "tfstate"
  }
}



provider "aws" {
  region = "ap-south-1"
}



resource "aws_instance" "myinstance1" {

    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = ["sg-00bdd2050b067edca"]
    key_name = var.key_name
    availability_zone = "ap-south-1a"

    tags = {
      Name = "myinstance1"
    }

  }

  variable "ami_id" {
    default = "ami-087d1c9a513324697"
  }

  variable "instance_type" {
    default = "t3.micro"
  }
  variable "key_name" {
    default = "t1-key"
  }

  output "instance_public_ip" {
    value = aws_instance.myinstance1.public_ip
    
  }
  output "instance_id" {
    value = aws_instance.myinstance1.id
    
  }