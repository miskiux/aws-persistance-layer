module "vnet" {
  source = "../../modules/vnet"
}

module "security" {
  source = "../../modules/shared/security"

  vpc_id = module.vnet.vpc_id
}



#
# Persistance layer
# 

module "file-system" {
  source             = "./file-system"
  private_subnet_ids = module.vnet.private_subnet_ids
  allow_nfs          = module.security.allow_nfs
  allow_all_egress   = module.security.allow_all_egress
}

module "ec2" {
  source               = "./ec2"
  private_subnet_ids   = module.vnet.private_subnet_ids
  file_system_id       = module.file-system.file_system_id
  allow_all_egress     = module.security.allow_all_egress
  allow_ssh            = module.security.allow_ssh
  iam_instance_profile = module.iam.iam_instance_profile

  depends_on = [module.file-system, module.iam]
}

module "iam" {
  source = "./iam"
}
