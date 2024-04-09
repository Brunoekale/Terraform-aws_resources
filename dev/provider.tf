# Configure the AWS Provider
  terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
}

provider "aws" {
 region = "us-east-1"
}

# Terraform backend
/*
terraform {
backend "s3" {
 bucket  = "terraform-backend-test"
 key     = "modules/terraform.tfstate"
 region  = "us-east-1"
 dynamobd_table = "terraform_lock"
  },
},
*/
