variable "aws_region" {
  description = "The AWS region to deploy the solution into"
  type        = string
}

variable "aws_access_key" {
  description = "The access key to authenticate with"
  type        = string
}

variable "aws_secret_key" {
  description = "The secret key to authenticate with"
  type        = string
}

variable "ssh_pub_key" {
  description = "The SSH public key component to install/add to EC2 Instances to enable SSH access"
  type        = string
}
