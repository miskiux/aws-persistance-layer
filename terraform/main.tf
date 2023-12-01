provider "aws" {
  alias   = "test"
  profile = "test"
  region  = "us-east-1"
}


module "vpc-net" {
  source = "./vpc-net"
}
