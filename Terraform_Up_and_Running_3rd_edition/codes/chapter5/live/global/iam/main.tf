provider "aws" {
  region = "ap-northeast-1"
}

# countを使うと配列扱いになることに注意
# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }

# moduleにもcountは使える
# module "users" {
#   source = "../../../modules/landing-zone/iam-user"

#   count = length(var.user_names)
#   user_name = var.user_names[count.index]
# }

# for_eachでリソースを作る
resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name     = each.value
}
