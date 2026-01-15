provider "aws" {
  region = "ap-northeast-1"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"

  # gitのリポジトリを参照できる
  # source = "github.com/brikis98/terraform-up-and-running-code//code/terraform/04-terraform-module/module-example/modules/services/webserver-cluster?ref=v0.3.0"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "naga-terraform-up-and-running-3rd-edition"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t3.micro"
  min_size      = 2
  max_size      = 2
}

# ステージング環境のみ追加でポートを開ける例
resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver-cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
