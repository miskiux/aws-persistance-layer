output "allow_nfs" {
  value = aws_security_group.allow_nfs.id
}

output "allow_all_egress" {
  value = aws_security_group.allow_all_egress.id
}

output "allow_ssh" {
  value = aws_security_group.allow_ssh.id
}
