variable "aws_instance_sizes" {
  type        = map(string)
  description = "instance sizes"
  default = {

    small  = "t2.micro"
    medium = "t2.small"
    large  = "t2.large"
  }
}