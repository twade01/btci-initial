
resource "aws_lb" "web" {
  # count = "${var.count}"
  name            = "web-${var.environment}"
  internal        = false
  load_balancer_type = "network"
  # security_groups = ["${aws_security_group.web-alb.id}"]
  subnets         = ["${var.public-a-subnet-id}", "${var.public-b-subnet-id}"]

  tags = {
    environment = "${var.environment}"
  }
}

resource "aws_lb_target_group" "web" {
  name     = "web-target-group-${var.environment}"
  port     = "8333"
  protocol = "TCP"
  vpc_id   = "${var.vpc-id}"
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = "${aws_lb.web.arn}"
  port              = "8333"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.web.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "web" {
  count = "${var.countnum}"

  target_group_arn = "${aws_lb_target_group.web.arn}"
  target_id        = "${element(aws_instance.web.*.id, count.index)}"
  port             = "8333"
}
