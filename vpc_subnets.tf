
resource "aws_subnet" "terraform-challenge-http-az-a" {
  vpc_id            = aws_vpc.terraform-challenge.id
  cidr_block        = "10.1.1.0/27"
  availability_zone = "ap-southeast-2a"

  tags = merge(local.common_tags, {
    "Name" = "terraform-challenge AZ A"
  })
}

resource "aws_subnet" "terraform-challenge-http-az-b" {
  vpc_id            = aws_vpc.terraform-challenge-vpc.id
  cidr_block        = "10.1.1.32/27"
  availability_zone = "ap-southeast-2b"

  tags = merge(local.common_tags, {
    "Name" = "terraform-challenge AZ B"
  })
}

resource "aws_route_table" "terraform-challenge" {
  vpc_id = aws_vpc.terraform-challenge.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-challenge.id
  }

  tags = merge(local.common_tags, {
    "Name" = "terraform-challenge Internet Route Table"
  })
}

resource "aws_route_table_association" "terraform-challenge-http-az-a" {
  subnet_id      = aws_subnet.terraform-challenge-http-az-a.id
  route_table_id = aws_route_table.terraform-challenge.id
}

resource "aws_route_table_association" "terraform-challenge-http-az-b" {
  subnet_id      = aws_subnet.terraform-challenge-http-az-b.id
  route_table_id = aws_route_table.terraform-challenge.id
}
