data "terraform_remote_state" "remote-state-redis-setup" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "Redis Setup/terraform.tfstate"
  }
}