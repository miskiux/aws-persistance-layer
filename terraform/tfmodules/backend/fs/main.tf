resource "aws_efs_file_system" "efs" {
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "true"

  tags = {
    Name = "aws_efs_file_system"
  }

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  count           = length(var.config.azs)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.config.private_subnets[count.index].id
  security_groups = [var.sg_id]
}

resource "aws_efs_access_point" "access_point" {
  file_system_id = aws_efs_file_system.efs.id

  root_directory {
    path = var.efs_access_point
  }

  tags = {
    Name = "aws_efs_access_point"
  }
}
