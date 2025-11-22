resource "aws_route_table" "public_subnet_rt" {
  vpc_id       = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-public-subnet-rt"
  }
}

resource "aws_route_table" "private_subnet_rt" {
  vpc_id        = var.vpc_id
  count         = length(var.private_subnet_ids)
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  tags = {
    Name = "${var.project_name}-private-subnet-${count.index+1}-rt"
  }
}

resource "aws_route_table_association" "public_subnet_to_rt_assoc" {
    count          = length(var.public_subnet_ids)
    subnet_id      = var.public_subnet_ids[count.index]
    route_table_id = aws_route_table.public_subnet_rt.id
}

resource "aws_route_table_association" "private_subnet_to_rt_assoc" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_subnet_rt[count.index].id
}