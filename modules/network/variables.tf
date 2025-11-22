variable "project_name" {
  type = string
  description = "Project Name for resource identification"
}

variable "vpc_id" {
  type = string
  description = "VPC id"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "Public subnet ids"
}

variable "private_subnet_ids" {
  type = list(string)
  description = "Private subnet ids"
}
