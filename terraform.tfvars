# General
region           = "eu-central-1"
profile          = "default"
credentials_file = "~/.aws/credentials"
default_tags = {
  Name : "Public-private-subnets",
  project : "Public-private-subnets"
}


# VPC
vpc_cidr_block = "10.0.0.0/16"


# EC2
ami_id            = "ami-0502e817a62226e03" // Ubuntu Server 20.04 LTS (HVM)
ec2_instance_type = "t2.micro"
pem_key_name      = "ec2-ssh"