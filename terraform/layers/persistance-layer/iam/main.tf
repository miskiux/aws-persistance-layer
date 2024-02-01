resource "aws_iam_instance_profile" "efs_utils_role_profile" {
  name = "efs_utils_role_profile"
  role = aws_iam_role.efs_utils_role.name
}

resource "aws_iam_role_policy_attachment" "efs-system-utils-role-attach" {
  role       = aws_iam_role.efs_utils_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticFileSystemsUtils"
}


resource "aws_iam_role" "efs_utils_role" {
  name        = "AmazonElasticFileSystemsUtilsRole"
  description = "Allows customers to use AWS Systems Manager to automatically manage Amazon EFS utilities (amazon-efs-utils) package on their EC2 instances, and use CloudWatchLog to get EFS file system mount success/failure notifications."

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
    }
  )

  tags = {
    tag-key = "efs_utils_role"
  }
}
