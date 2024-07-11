data "terraform_remote_state" "remote-state-base-ec2" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "EC2 Update/terraform.tfstate"
  }
}