module "vpc" {
  source = "git::https://github.com/emirates/platform-infra-modules.git//vpc?ref=main"
  env    = var.env
  region = var.region
}

module "eks" {
  source          = "git::https://github.com/emirates/platform-infra-modules.git//eks?ref=main"
  env             = var.env
  region          = var.region
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "aurora" {
  source          = "git::https://github.com/emirates/platform-infra-modules.git//aurora?ref=main"
  engine          = "aurora-postgresql"
  global_cluster  = true
  regions         = ["me-south-1", "eu-central-1", "ap-southeast-1"]
}
