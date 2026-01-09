provider "aws" {
  region = "ap-northeast-1"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-stage"
  db_remote_state_bucket = "naga-terraform-up-and-running-3rd-edition"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size = 2
  max_size = 2
}
