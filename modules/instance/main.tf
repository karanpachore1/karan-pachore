# resource "aws_instance" "myinstance" {
#   ami = var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.mysg3.id]
#   key_name = var.key_name
#   tags = {
#     Name = var.tags
#   }
# }