variable "environment" {}

variable "vpc-id" {}
variable "vpc-cidr-block" {}

variable "public-a-subnet-id" {}
variable "public-b-subnet-id" {}

variable "countnum" {
  default = 1
}

variable "listen-countnum" {
  default = 3
}
