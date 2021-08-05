
resource "aws_security_group" "alb" {
  name        = "terraform-challenge-alb"
  description = "Manages all connections to the ALB"
  vpc_id      = aws_vpc.terraform-challenge.id

  tags = merge(local.common_tags, {
    "Name" = "ALBs"
  })
}

resource "aws_security_group_rule" "alb-https" {
  type              = "ingress"
  description       = "HTTP"
  from_port         = "81"
  to_port           = "81"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  description       = "All"
  from_port         = "-1"
  to_port           = "-1"
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}


resource "aws_security_group" "webserver" {
  name        = "terraform-challenge-webserver"
  description = "Manages all connections to the internal web servers"
  vpc_id      = aws_vpc.terraform-challenge.id

  tags = merge(local.common_tags, {
    "Name" = "Webservers"
  })
}

resource "aws_security_group_rule" "http-custom" {
  type              = "ingress"
  description       = "HTTP"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.terraform-challenge.cidr_block]
  security_group_id = aws_security_group.webserver.id
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  description       = "ssh"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver.id
}

resource "aws_security_group_rule" "webserver-egress" {
  type              = "egress"
  description       = "All"
  from_port         = "-1"
  to_port           = "-1"
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserver.id
}
