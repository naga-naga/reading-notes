variable "server_port" {
  description = "HTTP リクエストを待ち受けるポート"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "クラスター名"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "DBのremote_stateのバケット名"
  type        = string
}

variable "db_remote_state_key" {
  description = "DBのremote_stateのパス"
  type        = string
}

variable "instance_type" {
  description = "EC2インスタンスタイプ"
  type        = string
}

variable "min_size" {
  description = "ECSインスタンスの最小数"
  type        = number
}

variable "max_size" {
  description = "ECSインスタンスの最大数"
  type        = number
}

variable "custom_tags" {
  description = "ASGにセットするカスタムタグ"
  type        = map(string)
  default     = {}
}
