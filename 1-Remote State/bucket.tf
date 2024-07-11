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
  bucket = aws_s3_bucket.s3-remote-state.id
  
  versioning_configuration {
    status = "Enabled"
  }

  lifecycle {
    ignore_changes = [
      versioning_configuration
    ]
  }
}