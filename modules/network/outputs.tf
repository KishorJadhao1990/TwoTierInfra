output "ec2_security_groups" {
  value = toset([aws_security_group.ec2-sg.id])
  description = "All security groups for EC2 traffic"
}

output "alb_security_groups" {
  value = toset([aws_security_group.alb-sg.id])
  description = "All security groups for alb traffic"
}

output "endpoint_" {
  value = aws_ec2_instance_connect_endpoint.endpoint.id
  description = "EC2 Connect endpoint id"
}
