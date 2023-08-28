terraform {
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"
    }
  }
}


data "template_file" "example" {
  template = file("${path.module}/data/data.json")
  vars = {
    testdata = "This is a test of the template_file data source"
  }
}

output "example" {
  value = "${data.template_file.example.rendered}"
}