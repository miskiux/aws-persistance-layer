provider "aws" {
  alias   = "test"
  profile = "test"
  region  = "eu-central-1"
}

module "layers" {
  source = "./layers"
}
