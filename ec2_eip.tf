
resource "aws_eip" "webserver_a_01" {
  instance = aws_instance.webserver_a_01.id
  vpc      = true
}

resource "aws_eip" "webserver_b_01" {
  instance = aws_instance.webserver_b_01.id
  vpc      = true
}
