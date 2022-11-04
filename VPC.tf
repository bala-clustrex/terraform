resource "aws_vpc" "tf-vpc" {
    cidr_block       = var.cidr_block
    instance_tenancy = "default"
    tags = {
      Name = var.vpc_tag
    }
  }
  resource "aws_subnet" "tf-public" {
     vpc_id     = aws_vpc.tf-vpc.id
    cidr_block = var.public_subnet_cidr_blocks
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
      Name = var.public_subnet_tag
    }
  }
  resource "aws_subnet" "tf-private" {
    vpc_id     = aws_vpc.tf-vpc.id
    cidr_block  = var.private_subnet_cidr_blocks
    availability_zone = "ap-south-1a"
    tags = {
      Name = var.private_subnet_tag
    }
  }
  resource "aws_internet_gateway" "tf-igw" {
      vpc_id = aws_vpc.tf-vpc.id
   
      tags = {
        Name = var.igw_tag
      }
    }
    resource "aws_eip" "tf-eip" {
    vpc      = true
  
    tags = {
      Name = var.eip_tag
    }
  }
  resource "aws_nat_gateway" "tf-ngw" {
    allocation_id = aws_eip.tf-eip.id
    subnet_id     = aws_subnet.tf-public.id
  
    tags = {
      Name = var.nat_tag
    }
  }
  resource "aws_route_table" "tf-rt-1" {
  vpc_id = aws_vpc.tf-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }

  tags = {
    Name = var.route_table1_tag
  }
}
resource "aws_route_table" "tf-rt-2" {
    vpc_id = aws_vpc.tf-vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.tf-ngw.id
    }
  
    tags = {
      Name = var.route_table2_tag
    }
}
resource "aws_route_table_association" "tf-rta-1" {
    subnet_id      = aws_subnet.tf-public.id
    route_table_id = aws_route_table.tf-rt-1.id
}
resource "aws_route_table_association" "tf-rta-2" {
    subnet_id      = aws_subnet.tf-private.id
    route_table_id = aws_route_table.tf-rt-2.id
}
resource "aws_security_group" "my_sg_1" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.tf-vpc.id 

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_tag
  }
}
