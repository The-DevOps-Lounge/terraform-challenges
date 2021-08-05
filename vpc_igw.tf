
resource "aws_internet_gateway" "terraform-challenge" {
  vpc_id = aws_vpc.terraform-challenge.id

  tags = merge(local.common_tags, {
    "Name" = "terraform-challenge"
  })
}