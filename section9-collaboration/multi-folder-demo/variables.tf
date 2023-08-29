variable "vpc_cidr_block" {
  type        = string
  description = "base cidr block for vpc"

}
variable "subnet_count" {
  type        = number
  description = "number of subnets to create"
}

variable "environment" {
  type        = string
  description = "environment name"
}

variable "aws_region" {
  type    = string
}
