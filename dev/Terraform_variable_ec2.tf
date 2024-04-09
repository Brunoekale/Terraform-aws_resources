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
  type           = string
} 

variable "vpc_id" {
  description = "Enter  VPC  ID where the resources will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Enter Subnet ID to be used for the Instance"
  type        = string
}


variable "ssh_key_pair" {
 description  = "Please enter  SSH KEY Pair to be used for EC2 Instance"
type            = string
}

variable "security_groups" {
  description = "Enter list of Security Groups"
  type        = list(string)
  # default   = ["test-SG"]
}

