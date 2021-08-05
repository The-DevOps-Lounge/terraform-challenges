
resource "aws_key_pair" "terraform-challenge" {
  key_name   = "terraform-challenges-access-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5aMwoTqPcO7RHfbZNS1TFiA5BG9u8SSyD7TAEx1vgfm7oY/gT7qVUfKheH79cwTE8STrsfb862P0EbshCwyTVMZHgufR7lvQ2ptZeeDrRLvEMJBIjr1RvH1POnnaL8il1nZTIN8zqg90dS+qZwPmffMCPOZNeU6TZJQVoaoh20J9m58JuQCC0w7VqN6qDiZHt2Z-fail!"
}
