module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "naga-terraform-up-and-running-3rd-edition"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size      = 2
  max_size      = 2

  custom_tags = {
    Owner      = "team-foo"
    DeployedBy = "terraform"
  }
}
