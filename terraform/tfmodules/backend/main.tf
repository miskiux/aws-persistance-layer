module "security" {
  source = "./security"

  config = var.config
}

module "file-system" {
  source = "./fs"

  config = var.config
  sg_id  = module.security.sg_id

}


resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "private_instance" {
  count = length(var.config.azs)

  ami                    = var.aws_ami
  instance_type          = var.instance_type
  subnet_id              = var.config.private_subnets[count.index].id
  key_name               = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [module.security.sg_id]
}
