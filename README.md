# Terraform codes
modules ("create_ec2_instance" "webserver {
source ="./modules/ec2" }
# Define variables too
ami_id = var.iam_id
resource_env = var.resource_env
instance_type = var.instance_type
owner_number = 121344
security_groups = var.security_groups

Modules ("create_s3_bucket" "bucket_name" {
 source ="./modules/s3" }                                                    
 # Define variables too                                                    
 bucket_name = var.bucket_name

Modules ("create_vpc" "my-test_vpc" {
source = " ./Modules/vpc" }
cidr_block = var.cidr
public_subnets = var.public_subnets
private_subnets = var.private_subnets
vpc_id = var.vpc_id
internet_gateway = var.internet_gateway
internet_gateway_id = var.gateway_id
 
