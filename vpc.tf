
resource "aws_vpc" "terraform-challenge" {
  cidr_block = "10.1.1.0/24"

  tags = merge(local.common_tags, {
    "Name" = "terraform-challenge"
  })
}
