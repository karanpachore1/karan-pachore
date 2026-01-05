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
