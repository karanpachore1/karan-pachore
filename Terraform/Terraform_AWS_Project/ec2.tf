resource "aws_instance" "web_server" {
  ami                    = "ami-0cfd0973db26b893b" # Amazon Linux 2 (eu-west-2)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}