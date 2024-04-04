# Create VPC

resource "aws_vpc" "Web-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
 enable_dns_hostname   = ture
  tags = {
    Name = "Web-vpc"
  }
}
# Internet Gateway for Public Subnet

resource "aws_internet_gateway" "Web_igw" {
  vpc_id = aws_vpc.Web-vpc.id
  tags = {
    Name = "Web_igw"
  }
}
# Create Public Subnet1
  resource "aws_subnet" "public_subnet1" {
  vpc_id                           = aws_vpc.Web-vpc.id
  cidr_block                       = "10.0.1.0/24"
 map_public_ip_on_launch           = true
 availability_zone                 = "us-east-1a"
  tags = {
    Name   = "public_subnet1"
  }
}

# Create Public Subnet2
  resource "aws_subnet" "public_subnet2" {
  vpc_id                           = aws_vpc.Web-vpc.id
  cidr_block                       = "10.0.3.0/24"
 map_public_ip_on_launch           = true
 availability_zone                 = "us-east-1b"
  tags = {
    Name   = "public_subnet2"
  }
}

# Create Route to add internet gateway for Public Subnets
  resource "aws_route_table" "web_public_route_table" {
  vpc_id = aws_vpc.Web-vpc.id

  route {
    cidr_block = "00.0.0.0/0"
    gateway_id = aws_internet_gateway.Web_igw.id
   tags = {
    Name = "public_route_table"
  }
}

# Associate the public subnet with the route table
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create a private subnet1
resource "aws_subnet" "private_subnet1" {
  vpc_id                             = aws_vpc.Web-vpc.id
  cidr_block                         = "10.0.2.0/24"
   map_public_ip_on_launch           = false
   availability_zone                 = "us-east-1a"
  tags = {
    Name  = "private_subnet1"
  }
}

# Create a private subnet1
resource "aws_subnet" "private_subnet2" {
  vpc_id                             = aws_vpc.Web-vpc.id
  cidr_block                         = "10.0.4.0/24"
   map_public_ip_on_launch           = false
   availability_zone                 = "us-east-1b"
  tags = {
    Name  = "private_subnet2"
  }
}

# Allocate an Elastic IP
Resource "aws_eip" "nat_eip" {
Domain = "vpc"
 }
}

# Create a Nat gateway
data "aws_nat_gateway" "nat_gw" {
subnet_id = aws_subnet.public_subnet.id
allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = "nat_gw"
  }
}

# Create a private subnet Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.Web-vpc.id
  }
}

Resource  "aws_route" "private_route" {
Route_table_id           = aws_route_table.private_route_table.id 
 destination_cidr_block  = "00.0.0.0/0"
 nat_gateway_id          = aws_nat_gateway.nat_gw.id
  }
}

resource "aws_route_table_association" "private_subnet_association" {
subnet_id      = aws_subnet.private_subnet.id
route_table_id = aws_route_table.private_route_table.id
 }
}


