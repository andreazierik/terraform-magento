output "magento-static-files-arn" {
  value = aws_s3_bucket.magento-static-files.arn
}

output "magento-static-files-bucket" {
  value = aws_s3_bucket.magento-static-files.bucket
}

output "magento-static-files-bucket-domain-name" {
  value = aws_s3_bucket.magento-static-files.bucket_domain_name
}

output "magento-s3-role-name" {
  value = aws_iam_role.magento-s3-role.name
}

output "magento-ec2-s3-profile-name" {
  value = aws_iam_instance_profile.magento-ec2-s3-profile.name
}


