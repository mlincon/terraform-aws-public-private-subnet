# VPC
# Routing table
# Internet Gateway
# NAT Gateway
# Elastic IP

# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  // instances with a public IP address receive corresponding public DNS hostnames
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.default_tags
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = var.default_tags
}

# Routing Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.default_tags
}