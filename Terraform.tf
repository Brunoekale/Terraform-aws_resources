module "my_test_vpc" {
  source                 = "./Modules/vpc"
  cidr_block             = var.cidr
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  vpc_id                 = aws_vpc.my_vpc.id
  availability_zones     = var.availability_zones
  nat_eip                = var.nat_eip
  nat_gateway_subnet_id  = var.nat_gateway_subnet_id
}

# Terraform codes to create EC2 instance
module "webserver" {
  source                        = "./modules/ec2"
  ami_id                       = var.ami_id
  resource_env          = var.resource_env
  ssh_key_pair           = var.ssh_key_pair
  instance_type         = var.instance_type
  vpc_id                      = var.vpc_id
  security_groups     = var.security_groups
 subnet_id                 = var.subnet_public_subnet1_id
}

# Terraform codes to create S3 bucket
module "bucket_name" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}
