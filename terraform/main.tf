provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket  = "terrastate-prod"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

module "production-infrastructure" {
  source = "./infrastructure"
  environment = "${var.environment}"
}

output "web-alb-dns-name" {
  value = "${module.production-infrastructure.web-alb-dns-name}"
}

output "web-instance-ips" {
  value = "${module.production-infrastructure.web-instance-ips}"
}
