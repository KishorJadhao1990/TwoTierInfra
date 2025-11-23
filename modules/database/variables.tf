variable "project_name" {
  type = string
  description = "Project Name for resource identification"
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}


variable "private_subnet_ids" {
  type = set(string)
  description = "Private subnet ids"
}

variable "security_group_ids" {
  type  = set(string)
  description = "List of security group IDs to associate with the database"
}