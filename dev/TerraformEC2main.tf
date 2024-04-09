# Terraform module_create EC2 instance
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
