# terraform {
#   backend "s3" {
#     bucket         = "naga-terraform-up-and-running-3rd-edition"
#     key            = "stage/data-stores/mysql/terraform.tfstate"
#     region         = "ap-northeast-1"
#     dynamodb_table = "terraform-up-and-running-locks"
#     encrypt        = true
#   }
# }

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = var.allocated_storage
  instance_class      = var.instance_class
  skip_final_snapshot = true
  db_name             = var.db_name

  username = var.db_username
  password = var.db_password
}
