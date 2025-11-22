resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Name" = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnets_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    "Name" = "${var.project_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    "Name" = "${var.project_name}-private-subnet-${count.index + 1}"
  }
}

