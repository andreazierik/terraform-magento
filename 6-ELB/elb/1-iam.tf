# resource "aws_iam_instance_profile" "magento-instance-profile-ltpl" {
#   name = "magento-instance-profile-ltpl"
#   role = data.terraform_remote_state.remote-state-s3-static-files.outputs.s3-static-files-magento-s3-role-name
# }