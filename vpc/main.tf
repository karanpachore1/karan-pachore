provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "pvtmysubnet" {
  vpc_id = aws_vpc.myvpc.id
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.1.0/20"
  map_public_ip_on_launch = false
  tags = {
   Name = "mypvtsubnet"
 }
}

resource "aws_subnet" "pubsubnet" {
  vpc_id = aws_vpc.myvpc.id
  availability_zone = "ap-south-1b"
  cidr_block = "10.0.2.0/20"
  map_public_ip_on_launch = true
  tags = {
   Name = "mypubsubnet"
 }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

 tags = {
   Name = "myigw"
 }
}
resource "aws_default_route_table" "myroute" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
 } 
 tags = {
   Name = "myroute"
 } 
}













# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"   # FIXED
#   tags = {
#     Name = "myvpc"
#   }
# }

# resource "aws_subnet" "pvtmysubnet" {
#   vpc_id = aws_vpc.myvpc.id
#   availability_zone = "ap-south-1a"
#   cidr_block = "10.0.1.0/24"  # FIXED
#   map_public_ip_on_launch = false
#   tags = {
#    Name = "mypvtsubnet"
#  }
# }

# resource "aws_subnet" "pubsubnet" {
#   vpc_id = aws_vpc.myvpc.id
#   availability_zone = "ap-south-1b"
#   cidr_block = "10.0.2.0/24"  # FIXED
#   map_public_ip_on_launch = true
#   tags = {
#    Name = "mypubsubnet"
#  }
# }

# resource "aws_internet_gateway" "myigw" {
#   vpc_id = aws_vpc.myvpc.id
#   tags = {
#    Name = "myigw"
#  }
# }

# resource "aws_default_route_table" "myroute" {
#   default_route_table_id = aws_vpc.myvpc.default_route_table_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myigw.id
#   }

#   tags = {
#    Name = "myroute"
#   }
# }
