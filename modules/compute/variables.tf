variable "project_name" {
  type = string
  description = "Project Name for resource identification"
}

variable "ami" {
  type        = string
  description = "AMI Type of EC2"
}

variable "instance_type" {
  type        = string
  description = "Instance Type of EC2"
}

variable "subnet_id" {
    type        = string
    description = "Subnet ID where EC2 will be launched"
}

variable "key_name" {
    type        = string
    description = "Name of the EC2 Key Pair for SSH access"
}

variable "security_groups" {    
    type        = set(string)
    description = "Security Group list to attach to the EC2 instance"
}

variable "enable_public_ip" {
  type = bool
  description = "Enable public IP address for EC2 instance"
}

variable "boot_script" {
  type        = string
  description = "User data script to initialize the EC2 instance"
  default     = ""
}

variable "tags" {
  type = map(string)
  description = "EC2 identification tags"
}