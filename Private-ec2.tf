resource "aws_instance" "instance-private" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.my_sg_1.id}"]
  subnet_id = aws_subnet.tf-private.id
  availability_zone = "ap-south-1a"
  key_name = var.key_name
  tags = {
    Name = var.private_instance_tag
   }
}