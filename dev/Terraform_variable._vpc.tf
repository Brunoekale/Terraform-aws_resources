# VARIABLE FOR VPC
variable "cidr" {
  description = "Please enter CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_cidr_blocks" {
  description = "Enter CIDR Blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]  # Adjust as needed
}

variable "private_cidr_blocks" {
  description = "Enter CIDR Blocks for private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.4.0/24"]  # Adjust as needed
} 

variable "public_subnets" {
  description = "Enter list of public subnets inside the VPC"
  type        = list(string)
  default     = ["public-subnet1", "public-subnet2"]
}

variable "private_subnets" {
  description = "Enter list of private subnets inside the VPC"
  type        = list(string)
  default     = ["private-subnet1", "private-subnet2"]
}

variable "availability_zones" {
  description = "Enter list of availability zones for subnets"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b"]  # Adjust as needed for your desired AZs
}

variable "vpc_id" {
  description = "Enter VPC ID"
  type        = string
}

variable "nat_eip" {
  description = "Enter Elastic IP for NAT Gateway"
  type        = string
}

variable "nat_gateway_subnet_id" {
  description = "Enter Subnet ID for NAT Gateway"
  type        = string
}

# RESOURCE DEFINITIONS
resource "aws_internet_gateway" "test-IGW" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "test-RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Destination CIDR block for internet traffic
    gateway_id = aws_internet_gateway.test-IGW.id
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Destination CIDR block for public_subnet1
    gateway_id = aws_internet_gateway.test-IGW.id  # This might need adjustment based on your network setup
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count           = length(var.public_subnets)
  route_table_id  = aws_route_table.test-RT.id
  subnet_id       = element(aws_subnet.public_subnets[*].id, count.index)
}

resource "aws_route_table_association" "private_subnet_association" {
  count           = length(var.private_subnets)
  route_table_id  = aws_route_table.private_route_table.id
  subnet_id       = element(aws_subnet.private_subnets[*].id, count.index)
}
