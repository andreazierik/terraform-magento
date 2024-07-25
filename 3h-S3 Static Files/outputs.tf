output "s3-static-files-magento-static-files-arn" {
  value = module.s3-static-files.magento-static-files-arn
}

output "s3-static-files-magento-static-files-bucket" {
  value = module.s3-static-files.magento-static-files-bucket
}

output "s3-static-files-magento-static-files-bucket-domain-name" {
  value = module.s3-static-files.magento-static-files-bucket-domain-name
}

output "s3-static-files-magento-s3-role-name" {
  value = module.s3-static-files.magento-s3-role-name
}

output "s3-static-files-magento-ec2-s3-profile-name" {
  value = module.s3-static-files.magento-ec2-s3-profile-name
}