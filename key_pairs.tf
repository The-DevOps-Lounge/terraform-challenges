
resource "aws_key_pair" "terraform-challenge" {
  key_name   = "terraform-challenges-access-key"
  public_key = var.ssh_public_key
}
