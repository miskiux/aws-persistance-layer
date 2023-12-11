resource "aws_security_group" "allow_nfs" {
  vpc_id      = var.vpc_id
  name        = "allow_nfs"
  description = "Allow NFS access"

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_ssh" {
  vpc_id      = var.vpc_id
  name        = "allow_ssh"
  description = "Allow SSH"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_egress" {
  vpc_id      = var.vpc_id
  name        = "allow_all_egress"
  description = "Allow outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
