terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    http = {
      source = "hashicorp/http"
      version = "3.4.0"
    }
  }

  required_version = ">= 1.2.0"
  
  backend "consul" {
    address = "localhost:8500"
    scheme  = "http"
    path    = "test/terraform.tfstate"
  }
}