
resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = var.key_name
  security_groups = var.security_groups
  associate_public_ip_address = var.enable_public_ip
  user_data = file(var.boot_script)
  tags = var.tags
}
