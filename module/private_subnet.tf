resource "aws_subnet" "private-subnet" {

  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 1) # 10.0.1.0/24
}