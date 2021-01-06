# EC2
# Security Group
# The EC2 is inside the public subet


# Security Group
resource "aws_security_group" "ec2-sg" {
  name = "allow-ssh-from-all"

  vpc_id = aws_vpc.vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = var.default_tags
}

# EC2
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.pem_key_name

  security_groups = [aws_security_group.ec2-sg.id]
  subnet_id       = aws_subnet.public-subnet.id

  associate_public_ip_address = true

  tags = var.default_tags
}