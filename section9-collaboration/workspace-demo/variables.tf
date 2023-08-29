variable "vpc_cidr_block" {
  type        = map(string)
  description = "base cidr block for vpc"

}
variable "subnet_count" {
  type        = map(number)
  description = "number of subnets to create"
}