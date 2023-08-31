locals {
  common_tags = {
    Environment = "${terraform.workspace}"
  }
}

# create vpc
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block[terraform.workspace]
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = merge(local.common_tags, { Name = "my-vpc-${terraform.workspace}" })
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

  backend "consul" {
    address = "localhost:8500"
    scheme  = "http"
    path    = "test/terraform.tfstate"
  }
}

