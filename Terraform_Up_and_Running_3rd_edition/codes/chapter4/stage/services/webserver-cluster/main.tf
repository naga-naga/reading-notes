provider "aws" {
  region = "ap-northeast-1"
}

module "webserver-cluster" {
  source = "../../../modules/services/webserver-cluster"
}
