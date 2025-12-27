provider "aws" {
  region = "ap-south-1"
}



resource "aws_instance" "myinstance" {

    ami = "ami-087d1c9a513324697"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-00bdd2050b067edca"]
    key_name = "t1=key"
    availability_zone = "ap-south-1a"

    tags = {
      name = "myinstance"
    }
  
}
