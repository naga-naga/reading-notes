provider "aws" {
  region = "ap-northeast-1"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "naga-terraform-up-and-running-3rd-edition"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro" # 本来ならもっと大きくする
  min_size = 2
  max_size = 10
}
