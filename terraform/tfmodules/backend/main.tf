module "security" {
  source = "./security"

  config = var.config
}

module "file-system" {
  source = "./fs"

  config = var.config
  sg_id  = module.security.sg_id
}

resource "aws_instance" "private_instance" {
  count = length(var.config.azs)

  ami                    = var.aws_ami
  instance_type          = var.instance_type
  subnet_id              = var.config.private_subnets[count.index].id
  vpc_security_group_ids = [module.security.sg_id]
  user_data              = templatefile("${path.module}/init.tftpl", { fs_id = module.file-system.file-system-id })

  depends_on = [
    module.file-system
  ]
}

resource "aws_ec2_instance_connect_endpoint" "connect_endpoint" {
  subnet_id = var.config.private_subnets[0].id
}
