data "terraform_remote_state" "remote-state-information" {
  backend = "s3"
  config = {
    region = var.region
    bucket = var.remote-state-bucket
    key    = "Remote State/terraform.tfstate"
  }
}