module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 3.14.2"

  name           = "my-vpc"
  cidr           = "10.0.0.0/16"
  azs            = ["eu-central-1a"]
  public_subnets = [cidrsubnet("10.0.0.0/16" , 8, 1)]

  create_igw = true

  manage_default_security_group  = true
  default_security_group_egress  = var.aws_sg_egress_rules
  default_security_group_ingress = var.aws_sg_ingress_rules
}

output "vpc_public_subnets" {
  value = module.vpc.public_subnets[0]
}


variable "aws_sg_ingress_rules" {
  type = list(map(string))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

}

variable "aws_sg_egress_rules" {
  type = list(map(string))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}