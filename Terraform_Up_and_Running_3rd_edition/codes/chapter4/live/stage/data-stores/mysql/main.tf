provider "aws" {
  region = "ap-northeast-1"
}

module "db" {
  source = "../../../modules/data-stores/mysql"

  db_username = var.db_username
  db_password = var.db_password
  db_name     = "stage-example-database"

  instance_class    = "db.t3.micro"
  allocated_storage = 10
}
