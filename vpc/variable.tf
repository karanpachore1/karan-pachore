variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.1.0/20"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.2.0/20"
}

variable "az_private" {
  description = "Availability zone for private subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "az_public" {
  description = "Availability zone for public subnet"
  type        = string
  default     = "ap-south-1b"
}
