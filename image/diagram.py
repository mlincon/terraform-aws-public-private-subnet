from diagrams import Cluster, Diagram

from diagrams.aws.compute import ECS
from diagrams.aws.database import RDS
from diagrams.aws.network import VPC
from diagrams.aws.network import PrivateSubnet
from diagrams.aws.network import PublicSubnet
from diagrams.aws.network import NATGateway
from diagrams.aws.network import RouteTable
from diagrams.aws.network import InternetGateway

# https://diagrams.mingrammer.com/docs/guides/
with Diagram('diagram_py', outformat='png'):

    vpc = VPC('VPC (10.0.0.0/16')
