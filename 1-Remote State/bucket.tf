# Caso o remote state já exista, para atualização dos outputs.
data "terraform_remote_state" "bucket-existente" {
  backend = "s3"
  config = {
    region = var.regiao
    bucket = var.remote-state-bucket
    key    = "Remote State/terraform.tfstate"
  }
}

# Caso ainda não exista.
resource "aws_s3_bucket" "s3-remote-state" {
  bucket = var.remote-state-bucket
  
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      bucket
    ]
  }
}

resource "aws_s3_bucket_versioning" "versionamento-s3-remote-state" {
  bucket = try(aws_s3_bucket.s3-remote-state.id, data.aws_s3_bucket.bucket-existente.id)

  versioning_configuration {
    status = "Enabled"
  }

  lifecycle {
    ignore_changes = [
      bucket,
      versioning_configuration
    ]
  }
}