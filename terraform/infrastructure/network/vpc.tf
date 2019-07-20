data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  name       = "ciapp"
  cidr_block = "10.0.0.0/16"

  tags = {
    name        = "ciapp"
    environment = "${var.environment}"
  }
}
