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
