
resource "aws_instance" "webserver_a_01" {
  instance_type = "t2.micro"
  key_name      = aws_key_pair.terraform-challenge.key_name
  ami           = local.ubuntu_ami
  subnet_id     = aws_subnet.terraform-challenge-http-az-a.id
  user_data = "./scripts/provision.sh"

  vpc_security_group_ids = [
    aws_security_group.webserver.id,
  ]

  tags = merge({
    Name = "terraform-challenge-webserver_a_01"
  }, local.common_tags)
}

resource "aws_instance" "webserver_b_01" {
  instance_type = "t2.micro"
  key_name      = aws_key_pair.terraform-challenge.key_name
  ami           = local.ubuntu_ami
  subnet_id     = aws_subnet.terraform-challenge-http-az-b.id
  user_data = file("./scripts/provision.sh")

  vpc_security_group_ids = [
    aws_security_group.webserver.id,
  ]

  tags = merge({
    Name = "terraform-challenge-webserver_b_01"
  }, local.common_tags)
}
