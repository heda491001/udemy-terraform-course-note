
resource "aws_vpc" "vpc2" {

  for_each = {
    private = {
      cidr = "10.3.0.0/16"
      name = "private"
    }
    public  = {
      cidr = "192.168.0.0/16"
      name = "public"
    }
  }

  cidr_block           = each.value.cidr
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-vpc-${each.value.name}"
  }
}

output "vpc_public_id" {
  value = aws_vpc.vpc2["public"].id
}