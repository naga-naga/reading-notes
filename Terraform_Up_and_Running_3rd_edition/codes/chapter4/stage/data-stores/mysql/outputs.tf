output "address" {
  value       = aws_db_instance.example.address
  description = "DBのエンドポイント"
}

output "port" {
  value       = aws_db_instance.example.port
  description = "DBのポート番号"
}
