terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "consul"
  config = {
    address = "localhost:8500"
    scheme  = "http"
    path    = "test/terraform.tfstate"
  }
}

output "data-from-remote-state" {
  value = data.terraform_remote_state.vpc.outputs.vpc-id
}


