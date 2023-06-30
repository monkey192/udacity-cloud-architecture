# Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "env_name" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

# AMI
variable "instance_image_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      env = var.env_name
    }
  }
}

# provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "ec2_udacity_1" {
  count           = 4
  ami             = var.instance_image_id
  instance_type   = "t2.micro"
  subnet_id       = var.subnet_id
  security_groups = [var.security_group_id]
  tags = {
    Name = "Udacity T2"
  }
}

# provision 2 m4.large EC2 instances named Udacity M4
# resource "aws_instance" "ec2_udacity_2" {
#   count           = 2
#   ami             = var.instance_image_id
#   instance_type   = "m4.large"
#   subnet_id       = var.subnet_id
#   security_groups = [var.security_group_id]
#   tags = {
#     Name = "Udacity T4"
#   }
# }