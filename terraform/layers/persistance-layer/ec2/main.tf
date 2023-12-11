resource "aws_instance" "ec2_private_instance" {
  count = length(var.private_subnet_ids)

  ami                    = var.aws_ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.allow_all_egress, var.allow_ssh]
  user_data              = templatefile("${path.module}/init.tftpl", { fs_id = var.file_system_id })
}
