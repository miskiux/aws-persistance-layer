resource "aws_efs_file_system" "fs" {
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "true"

  tags = {
    Name = "file_system"
  }

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  count           = length(var.config.azs)
  file_system_id  = aws_efs_file_system.fs.id
  subnet_id       = var.config.private_subnets[count.index].id
  security_groups = [var.sg_id]
}

resource "aws_efs_access_point" "access_point" {
  file_system_id = aws_efs_file_system.fs.id

  root_directory {
    path = var.fs_access_point
  }

  tags = {
    Name = "access_point"
  }
}
