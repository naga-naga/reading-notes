variable "user_names" {
  description = "作成するIAMユーザ名"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}
