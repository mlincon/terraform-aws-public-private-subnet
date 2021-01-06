# Subnet
resource "aws_subnet" "public-subnet" {
  depends_on        = [aws_vpc.vpc]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, 0) # 10.0.0.0/24
  availability_zone = var.subnet_availability_zone

  map_public_ip_on_launch = true

  tags = var.default_tags
}

# Associate route table to subnet
# does not have a tags option
resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt-igw.id
}