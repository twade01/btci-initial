provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket  = "terrastate-stage"
    key     = "terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}

module "staging-infrastructure" {
  source = "./infrastructure"
  environment = "${var.environment}"
}

output "web-lb-dns-name" {
  value = "${module.staging-infrastructure.web-lb-dns-name}"
}

output "web-instance-ips" {
  value = "${module.staging-infrastructure.web-instance-ips}"
}
