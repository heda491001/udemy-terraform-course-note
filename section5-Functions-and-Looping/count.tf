# use count
resource "aws_vpc" "vpc" {

  count                = 2
  cidr_block           = "10.${count.index}.0.0/16"
  enable_dns_hostnames = true
  tags                 = {
    Name = "terraform-vpc-${count.index}"
  }
}

# Create a Subnet
output "vpc_id" {
  value = aws_vpc.vpc[0].id
}