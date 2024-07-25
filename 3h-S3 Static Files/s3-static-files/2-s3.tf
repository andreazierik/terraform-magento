resource "aws_s3_bucket" "magento-static-files" {
  bucket = "brunoferreira86services-magento-static-files"

  tags = {
    Name = "brunoferreira86services-magento-static-files"
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

resource "aws_s3_bucket_public_access_block" "magento-static-files-access-block" {
  bucket = aws_s3_bucket.magento-static-files.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# resource "aws_s3_bucket_policy" "magento-static-files-policy" {
#   bucket = aws_s3_bucket.magento-static-files.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           AWS = "${aws_iam_role.magento-s3-role.arn}"
#         },
#         Action = [
#           "s3:PutObject",
#           "s3:GetObject",
#           "s3:ListBucket",
#           "s3:DeleteObject"
#         ],
#         Resource = [
#           "${aws_s3_bucket.magento-static-files.arn}",
#           "${aws_s3_bucket.magento-static-files.arn}/*"
#         ]
#       }
#     ]
#   })
# }

resource "aws_iam_role" "magento-s3-role" {
  name = "magento-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "magento-s3-policy" {
  name = "magento-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteBucket",
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.magento-static-files.arn}",
          "${aws_s3_bucket.magento-static-files.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "magento-s3-attachment" {
  role       = aws_iam_role.magento-s3-role.name
  policy_arn = aws_iam_policy.magento-s3-policy.arn
}

resource "aws_iam_instance_profile" "magento-ec2-s3-profile" {

  name = "magento-ec2-s3-profile"
  # role = data.terraform_remote_state.remote-state-s3-static-files.outputs.s3-static-files-magento-s3-role-name  
  role = aws_iam_role.magento-s3-role.name
}