output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "db_address" {
  value = aws_db_instance.mysql.address
}