resource "aws_security_group" "actu_en_clase" {
  name        = "act_en_clase"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-a59966d8"



  ingress {
    description = "all from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "todo_el_trafico"
  }
}
