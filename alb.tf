
resource "aws_alb" "terraform-challenge" {
  name = "terraform-challenge"

  subnets = [
    aws_subnet.terraform-challenge-http-az-a.id,
    aws_subnet.terraform-challenge-http-az-b.id,
  ]

  security_groups = [
    aws_security_group.alb.id
  ]

  tags = merge(local.common_tags, {
    "Name" = "Terraform Challenge HTTP ALB"
  })
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.terraform-challenge.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
      message_body = "Meow?"
    }
  }
}

resource "aws_lb_listener_rule" "webservers" {
  listener_arn = aws_alb_listener.http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.webservers.arn
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

resource "aws_alb_target_group" "webservers" {
  name     = "terraform-challenge-web-servers"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.terraform-challenge.id

  tags = merge(local.common_tags, {
    "Name" = "Terraform Challenge HTTP Servers"
  })
}

resource "aws_lb_target_group_attachment" "webservers_a" {
  target_group_arn = aws_alb_target_group.webservers.arn
  target_id        = aws_instance.webserver_a_01.id
}

resource "aws_lb_target_group_attachment" "webservers_b" {
  target_group_arn = aws_alb_target_group.webservers.arn
  target_id        = aws_instance.webserver_b_01.id
}
