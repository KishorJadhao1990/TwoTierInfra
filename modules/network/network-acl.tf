resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-nacl"
  }
}

resource "aws_network_acl_association" "public_subnet_to_nacl_assoc" {
  count = length(var.public_subnet_ids)
  network_acl_id = aws_network_acl.nacl.id
  subnet_id      = var.public_subnet_ids[count.index]
}

resource "aws_network_acl_association" "private_subnet_to_nacl_assoc" {
  count       = length(var.private_subnet_ids)
  network_acl_id = aws_network_acl.nacl.id
  subnet_id      = var.private_subnet_ids[count.index]
}

