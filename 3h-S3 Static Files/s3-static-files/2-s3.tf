resource "aws_s3_bucket" "magento-static-files" {
  bucket = "brunoferreira86services-magento-static-files"  

  tags = {
    Name        = "brunoferreira86services-magento-static-files"
  }
}

# resource "aws_s3_bucket_versioning" "versionamento-s3-remote-state" {
#   bucket = aws_s3_bucket.magento-static-files.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_acl" "magento-static-files-acl" {
#   bucket = aws_s3_bucket.magento-static-files.id
#   acl    = "private"
# }

resource "aws_s3_bucket_public_access_block" "magento-static-files" {
  bucket = aws_s3_bucket.magento-static-files.bucket

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "magento-static-files-policy" {
  bucket = aws_s3_bucket.magento-static-files.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "s3:GetObject"
        Effect = "Allow"
        Resource = "${aws_s3_bucket.magento-static-files.arn}/*"
        Principal = "*"
      }
    ]
  })
}

