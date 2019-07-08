data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-ubuntu-amd64-app-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
