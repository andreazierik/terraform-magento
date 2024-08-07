data "terraform_remote_state" "remote-state-vpc" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "VPC Network/terraform.tfstate"
  }
}

data "terraform_remote_state" "remote-state-rds" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "RDS Database/terraform.tfstate"
  }
}

# data "terraform_remote_state" "remote-state-efs" {
#   backend = "s3"
#   config = {
#     region = var.regiao
#     bucket = var.remote-state-bucket
#     key    = "EFS/terraform.tfstate"
#   }
# }

data "terraform_remote_state" "remote-ami" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "AMI Create/terraform.tfstate"
  }
}