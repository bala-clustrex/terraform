resource "aws_instance" "instance-public" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.my_sg_1.id}"]
  subnet_id = aws_subnet.tf-public.id
  availability_zone = "ap-south-1a"
  key_name = var.key_name
tags = {
    Name = var.public_instance_tag
   }
}
resource "aws_eip" "instance-eip" {
  instance = aws_instance.instance-public.id
  vpc      = true
  tags = {
      Name = var.instance_eip_tag
    }
}
resource "aws_eip_association" "aws-eip" {
  instance_id   = aws_instance.instance-public.id
  allocation_id = aws_eip.instance-eip.id
}
