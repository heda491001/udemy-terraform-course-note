variable "aws_regions" {

    type = list(string)

    description = "Region to use for AWS"

    default = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]

  }