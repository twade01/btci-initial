locals {
  subnets_ids = [
    "${var.public-a-subnet-id}",
    "${var.public-b-subnet-id}",
  ]
}

resource "aws_instance" "web" {
  count = "${var.count}"

  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  subnet_id = "${element(local.subnets_ids, count.index)}"

  vpc_security_group_ids = [
    "${aws_security_group.web.id}",
  ]

  tags = {
    environment = "${var.environment}"
  }
}
