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

  egress {
    from_port   = 18556
    to_port     = 18556
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 18555
    to_port     = 18555
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 18555
    to_port     = 18555
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc-cidr-block}"]
  }

  ingress {
    from_port   = 18556
    to_port     = 18556
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc-cidr-block}"]
  }

  ingress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc-cidr-block}"]
  }

  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
}

resource "aws_security_group" "web-lb" {
  name        = "web-lb"
  description = "Web LB"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 18556
    to_port     = 18556
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 18555
    to_port     = 18555
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8333
    to_port     = 8333
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 18556
    to_port     = 18556
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 18555
    to_port     = 18555
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

  egress {
    from_port       = 18556
    to_port         = 18556
    protocol        = "tcp"
    cidr_blocks     = ["${var.vpc-cidr-block}"]
    security_groups = ["${aws_security_group.web.id}"]
  }

  egress {
    from_port       = 18555
    to_port         = 18555
    protocol        = "tcp"
    cidr_blocks     = ["${var.vpc-cidr-block}"]
    security_groups = ["${aws_security_group.web.id}"]
  }
}
