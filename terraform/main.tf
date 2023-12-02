provider "aws" {
  alias   = "test"
  profile = "test"
  region  = "eu-central-1"
}

module "vpc" {
  source = "./tfmodules/vpc"
}

module "file-system" {
  source          = "./tfmodules/file-system"
  azs             = module.vpc.azs
  private_subnets = module.vpc.private_subnets

  depends_on = [
    module.vpc
  ]
}

