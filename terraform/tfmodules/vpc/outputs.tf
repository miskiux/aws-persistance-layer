output "azs" {
  value = var.azs
}

output "private_subnets" {
  value = aws_subnet.private
}
