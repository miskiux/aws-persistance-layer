output "azs" {
  value = var.azs
}

output "private_subnets" {
  value = aws_subnet.private
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

