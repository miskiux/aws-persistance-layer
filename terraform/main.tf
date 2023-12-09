provider "aws" {
  alias   = "test"
  profile = "test"
  region  = "eu-central-1"
}

module "vpc" {
  source = "./tfmodules/vpc"
}

locals {
  global_config = {
    azs             = module.vpc.azs
    private_subnets = module.vpc.private_subnets
    vpc_id          = module.vpc.vpc_id
  }
}

module "backend" {
  source = "./tfmodules/backend"
  config = local.global_config

  depends_on = [
    module.vpc,
  ]
}
