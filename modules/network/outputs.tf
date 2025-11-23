output "ec2_security_groups" {
  value = toset([aws_security_group.ec2-sg.id])
  description = "All security groups for EC2 traffic"
}

output "rds_security_groups" {
  value = toset([aws_security_group.rds-sg.id])
  description = "All security groups for RDS traffic"
}

