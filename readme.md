## Diagram

AWS VPC with Private and Public Subnets via Terraform

![diagram](image/diagram.png)

### Steps
1. Create a provider and version for AWS
2. Create/Get an AWS key pair or use an existing one for SSH access
3. Create a VPC
4. Create an Internet Gateway for instances in the public subnet to access the internet
5. Create a routing table consisting of the information of Internet Gateway
6. Public subnet with an EC2 instance  
    6.1. Create a public subnet inside the VCP with auto public IP assignment enabled  
    6.2. Associate the routing table to the public subnet to provide the Internet Gateway address, thus direct traffic to the Internet Gateway allowing access to and from the Internet  
    6.3. Create a Security Group for the EC2 instance, so that it is possible to access it by SSH  
    6.4. Create an EC2 instance  
7. Private subnet  
    7.1. Create another subnet inside the VPC   
    7.2. Create an Elastic IP for NAT Gateway  
    7.3. Create a NAT Gateway in the public subnet  
    7.4. Create a route table for the NAT Gateway  
    7.5. Associate the above routing table to the private subnet

#### Private Subnet
- instances launched inside the private subnet will be able to communicate with any services within the VPC 
- the NAT Gateway [NAT] allows instances in the private subnet to connect to the Internet (via Internet Gateway [IGW])
    - Private subnet &rarr; NAT &rarr; IGW
- the NAT Gateway
    - is managed by AWS
    - is created/specific to AZ
    - requires an Elastic IP
    - requires an Internet Gateway for connecting to internet
    

## References:
- [Terraform recipe - Managing AWS VPC - Creating Private Subnets](https://hands-on.cloud/terraform-recipe-managing-aws-vpc-creating-private-subnets/)
- [Launching a VPC with Public & Private subnet & NAT Gateway in AWS using Terraform!](https://harshitdawar.medium.com/launching-a-vpc-with-public-private-subnet-nat-gateway-in-aws-using-terraform-99950c671ce9)
- [Terraform: AWS VPC with Private and Public Subnets](https://nickcharlton.net/posts/terraform-aws-vpc.html)
- [How to setup a basic VPC with EC2 and RDS using Terraform](https://dev.to/rolfstreefkerk/how-to-setup-a-basic-vpc-with-ec2-and-rds-using-terraform-3jij#rds)