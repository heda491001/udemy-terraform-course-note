terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

variable "aws_access_key" {

  type        = string
  description = "aws access key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "aws secret key"
  sensitive   = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enable dns hostname"
  default     = true
}

variable "aws_regions" {
    type = list(string)
    description = "Region to use for AWS"
    default = ["ap-northeast-1", "us-east-2", "us-west-1", "us-west-2"]

}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_regions[0]
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "my-vpc-demo"
  }
}