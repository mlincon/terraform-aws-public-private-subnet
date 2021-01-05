# Subnet
resource "aws_subnet" "private-subnet" {
  depends_on = [ aws_vpc.vpc ]
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 1) # 10.0.1.0/24
  availability_zone = var.subnet_availability_zone

  map_public_ip_on_launch = false

  tags = var.default_tags
}

# Associate NAT Gateway route table to this subnet
resource "aws_route_table_association" "private-rt-association" {
  subnet_id = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.rt-nat.id
}