provider "aws" {
  region = "ap-northeast-1"
}

module "db" {
  source = "../../../modules/data-stores"

  db_username = var.db_username
  db_password = var.db_password
}
