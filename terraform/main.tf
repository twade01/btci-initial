provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket  = "terrastate-prod"
    key     = "terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}

module "production-infrastructure" {
  source = "./infrastructure"
  environment = "${var.environment}"
}

output "web-lb-dns-name" {
  value = "${module.production-infrastructure.web-lb-dns-name}"
}

output "web-instance-ips" {
  value = "${module.production-infrastructure.web-instance-ips}"
}
