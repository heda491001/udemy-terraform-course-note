variable "ami_ubuntu" {
  type        = string
  description = "ami ubuntu"
  default     = "ami-0590f3a1742b17914"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t2.micro"
}