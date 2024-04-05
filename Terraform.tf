# Terraform codes to create EC2 instance
module "webserver" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  resource_env    = var.resource_env
  instance_type   = var.instance_type
  security_groups = var.security_groups
}

# Terraform codes to create S3 bucket
module "bucket_name" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

# Terraform codes to create VPC
module "my_test_vpc" {
  source                 = "./Modules/vpc"
  cidr_block             = var.cidr
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  vpc_id                 = var.vpc_id
  availability_zones     = var.availability_zones
  eip_domain             = var.eip_domain
  nat_gateway_subnet_id  = var.nat_gateway_subnet_id
}

