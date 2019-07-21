module "network" {
  source = "./network"
  environment = "${var.environment}"
}

module "instances" {
  source = "./instances"

  environment = "${var.environment}"

  vpc-id         = "${module.network.vpc-id}"
  vpc-cidr-block = "${module.network.vpc-cidr-block}"

  public-a-subnet-id = "${module.network.public-a-subnet-id}"
  public-b-subnet-id = "${module.network.public-b-subnet-id}"

}
