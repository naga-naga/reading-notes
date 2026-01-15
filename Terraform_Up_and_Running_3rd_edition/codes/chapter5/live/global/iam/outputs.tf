output "first_user_arn" {
  # countを使って作ったので配列になっている。インデックスアクセスが必要。
  value       = aws_iam_user.example[0].arn
  description = "最初のユーザのARN"
}

output "all_arns" {
  # [*]で全てに対して操作
  value       = aws_iam_user.example[*].arn
  description = "全ユーザのARN"
}
