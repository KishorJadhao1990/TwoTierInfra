output "project_name" {
  value = var.project_name
  description = "Project Name for resource identification"
}
output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "VPC Id after creation"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "Public Subnet Ids after creation"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnets[*].id
  description = "Private Subnet Ids after creation"
}

