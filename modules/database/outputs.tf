output "postgres-status" {
  value = aws_db_instance.postgres.status
  description = "Status of the Postgres RDS instance"
}

output "postgres-identifier" {
  value = aws_db_instance.postgres.identifier
  description = "Name of the Postgres RDS instance"
}