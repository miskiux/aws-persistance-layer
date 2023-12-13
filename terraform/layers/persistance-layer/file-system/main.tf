resource "aws_efs_file_system" "file_system" {
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
  count           = length(var.private_subnet_ids)
  file_system_id  = aws_efs_file_system.file_system.id
  subnet_id       = var.private_subnet_ids[count.index]
  security_groups = [var.allow_nfs, var.allow_http, var.allow_all_egress]
}

resource "aws_efs_access_point" "access_point" {
  file_system_id = aws_efs_file_system.file_system.id

  root_directory {
    path = var.access_point
  }

  tags = {
    Name = "access_point"
  }
}
