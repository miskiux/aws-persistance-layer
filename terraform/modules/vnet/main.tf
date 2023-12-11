# vpc, subnet, endpoints

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "aws_vpc"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "aws_subnet_private_${count.index + 1}"
  }
}


# 
# VPC Endpoints
# 
resource "aws_ec2_instance_connect_endpoint" "connect_endpoint" {
  subnet_id = aws_subnet.private_subnet[0].id

  tags = {
    description = "SSH inbound for ec2 instances"
  }
}

resource "aws_vpc_endpoint" "lambda_endpoint" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.eu-central-1.lambda"
  vpc_endpoint_type = "Interface"

  tags = {
    description = "Expose lambda to external APIs"
  }
}
