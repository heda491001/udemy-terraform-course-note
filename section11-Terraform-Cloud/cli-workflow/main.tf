# create vpc
resource "aws_vpc" "vpc" {

  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags                 = {
    Name = "terraform-vpc"
  }
}

terraform {
  cloud {
    organization = "hesai-private"

    workspaces {
      name = "cli-workspace-demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_access_key" {
  type = string        
  sensitive = true 
}

variable "aws_secret_key" {
  type = string        
  sensitive = true 
}