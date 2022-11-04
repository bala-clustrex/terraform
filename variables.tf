 variable "access_key" {
     description = "Access key to AWS console"
     
}
variable "secret_key" {
     description = "Secret key to AWS console"
     
}
variable "cidr_block" {
  default    = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = "10.0.0.0/24"
  type        = string
  description = "public subnet CIDR block"
}

variable "private_subnet_cidr_blocks" {
  default     = "10.0.1.0/24"
  type        = string
  description = "private subnet CIDR block"
}

variable "vpc_tag" {
  default = "Vpc-new"
  type = string
  description = "VPC tag Name"
} 
variable "public_subnet_tag" {
  default = "public-subnet"
  type = string
  description = "public subnet tag Name"
} 
variable "private_subnet_tag" {
  default = "private-subnet"
  type = string
  description = "private subnet tag Name"
}
variable "igw_tag" {
  default = "igw-1"
  type = string
  description = "internet gateway tag Name"
}
variable "eip_tag" {
  default = "eip-new"
  type = string
  description = "eip tag Name"
}
variable "nat_tag" {
  default = "nat-igw"
  type = string
  description = "nat gateway tag Name"
}
variable "route_table1_tag" {
  default = "route-table-1"
  type = string
  description = "route table 1 tag Name"
}
variable "route_table2_tag" {
  default = "route-table-2"
  type = string
  description = "route table 2 tag Name"
}
variable "sg_tag" {
  default = "sg-new1"
  type = string
  description = "security group tag"
}
variable "ami_id" {
type = string
default = "ami-0e6329e222e662a52"
description = "instance ami"
}
variable "instance_type" {
  default = "t2.micro"
  type = string
  description = "instance type"
}
variable "public_instance_tag" {
  default = "Public-instance"
  type = string
  description = "public instance tag name"
}
variable "private_instance_tag" {
  default = "Private-instance"
  type = string
  description = "private instance tag name"
}
variable "key_name" {
  default = "04-08-22-key"
  type = string
  description = "key name"
}
variable "instance_eip_tag" {
  default = "instance-eip"
  type = string
  description = "instance eip tag"
}