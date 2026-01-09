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

variable "db_name" {
  description = "DBの名前"
  type        = string
}

variable "allocated_storage" {
  description = "allocated_storage"
  type        = number
}

variable "instance_class" {
  description = "DBのインスタンスクラス"
  type        = string
}
