provider "aws" {
  region = var.regiao  
  default_tags {
    tags = {
      "owner"      = var.autor
      "project"    = var.projeto
      "customer"   = var.cliente
      "managed-by" = "terraform"
    }
  }
}

resource "aws_s3_bucket" "s3-remote-state" {
  bucket = var.remote-state-bucket
}

resource "aws_s3_bucket_versioning" "versionamento-s3-remote-state" {
  bucket = aws_s3_bucket.s3-remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}