# VARIABLE FOR EC2 INSTANCE
variable "ami_id" {
  description = "Please enter AMI ID for EC2 instance"
  type        = string
}

variable "resource_env" {
  description = "Please enter resource environment name"
  type        = string
}
                                                       
variable "instance_type" {
  description = "Please enter instance type"
  type        = string
} 

variable "security_groups" {
  description = "Enter list of Security Groups"
  type        = list(string)
  # default   = ["test-SG"]
}

# VARIABLES FOR S3 BUCKET
variable "s3_bucket" {
  description = "Please enter bucket name"
  type        = string
}

# VARIABLE FOR VPC
variable "cidr" {
  description = "Please enter CIDR block for VPC"
  type        = string
  # default   = "10.0.0.0/16"
}

# VARIABLES FOR SUBNETS
variable "public_subnets" {
  description = "Enter list of public subnets inside the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "Enter list of private subnets inside the VPC"
  type        = list(string)
}

variable "availability_zones" {
  description = "Enter list of availability zones for subnets"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b"]  # Adjust as needed for your desired AZs
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_cidr_blocks" {
  description = "Enter CIDR Blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]  # Adjust as needed
}

variable "private_cidr_blocks" {
  description = "Enter CIDR Blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]  # Adjust as needed
} 

variable "eip_domain" {
  description = "Enter domain for the Elastic IP"
  type        = string
  # default   = "vpc"
} 

variable "nat_gateway_subnet_id" {
  description = "Enter Subnet ID for NAT Gateway"
  type        = string
}

# RESOURCE DEFINITIONS
resource "aws_internet_gateway" "test-IGW" {
  vpc_id      = var.vpc_id
  description = "Internet Gateway for VPC ${var.vpc_id}"
}

<<<<<<< HEAD
resource "aws_route_table" "test-RT"  {
  # Enter configuration for route table
=======
resource "aws_route_table" "test-RT" {
  vpc_id      = var.vpc_id
  description = "Route Table for VPC ${var.vpc_id}"
>>>>>>> af51067c37d347cec5e1dc9a90ee4ea121c42b55
}

resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.test-RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.test-IGW.id
  description            = "Route to Internet Gateway"
}

resource "aws_route_table_association" "test-RTA" {
<<<<<<< HEAD
  # Enter configuration for route table association
}
=======
  subnet_id      = var.public_subnets[0] // Example: Assuming the first public subnet
  route_table_id = aws_route_table.test-RT.id
  description    = "Associating public subnet with route table"
}



>>>>>>> af51067c37d347cec5e1dc9a90ee4ea121c42b55
