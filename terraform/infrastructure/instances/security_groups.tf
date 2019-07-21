resource "aws_security_group" "web" {
  name        = "Web"
  description = "Web"
  vpc_id      = "${var.vpc-id}"

  egress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.web-alb.id}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    environment = "${var.environment}"
    # name        = "web-${var.environment}"
  }
}

resource "aws_security_group" "web-alb" {
  name        = "web-alb"
  description = "Web ALB"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 8333
    to_port         = 8333
    protocol        = "tcp"
    cidr_blocks     = ["${var.vpc-cidr-block}"]
    security_groups = ["${aws_security_group.web.id}"]
  }

  # egress {
  #   from_port       = 8333
  #   to_port         = 8333
  #   protocol        = "tcp"
  #   cidr_blocks     = ["${var.vpc-cidr-block}"]
  # }

  tags = {
    environment = "${var.environment}"
    # name        = "web-alb-${var.environment}"
  }
}
