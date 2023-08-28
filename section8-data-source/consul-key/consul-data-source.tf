terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

data "consul_keys" "data_source_name" {
  key {
    name = "key_name"
    path = "test/terraform.tfstate"
    default = "No value found"
  }
}

output "consul_keys" {
  value = jsondecode(data.consul_keys.data_source_name.var.key_name)["resources"]["1"]["name"]
}
