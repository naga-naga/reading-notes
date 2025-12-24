variable "db_username" {
  description = "DBのユーザ名"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "DBのパスワード"
  type        = string
  sensitive   = true
}
