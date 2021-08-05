
locals {
  ubuntu_ami = "ami-0a43280cfb87ffdb"

  common_tags = {
    "Solution"    = "Terraform Challenge Solution"
    "Environment" = "Training"
    "Contact"     = "Michael Crilly at The DevOps Lounge"
  }
}
