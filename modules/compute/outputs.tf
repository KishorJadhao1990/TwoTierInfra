output "instance_public_ip" {
  value = aws_instance.web.public_ip
  description = "Instance public IP"
}

output "instance_id" {
  value = aws_instance.web.id
  description = "Instance ID"
}