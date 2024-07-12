data "terraform_remote_state" "remote-state-vpc" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "VPC Network/terraform.tfstate"
  }
}

data "terraform_remote_state" "remote-elb" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "ELB/terraform.tfstate"
  }
}

data "terraform_remote_state" "remote-acm-ssl" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "ACM-SSL/terraform.tfstate"
  }
}