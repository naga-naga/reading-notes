output "public_ip" {
  description = "EC2 インスタンスの Public IP アドレス"
  value       = aws_lb.example.dns_name
}
