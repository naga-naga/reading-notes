output "public_ip" {
  description = "EC2 インスタンスの Public IP アドレス"
  value       = aws_lb.example.dns_name
}

output "asg_name" {
  value       = aws_autoscaling_group.example.name
  description = "Auto Scaling Groupの名前"
}

output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "ロードバランサのドメイン名"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "ロードバランサに紐づけられたセキュリティグループのID"
}
