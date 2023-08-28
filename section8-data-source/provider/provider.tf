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