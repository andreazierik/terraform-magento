output "ec2-update-base-ami" {
  description = "EC2 base para criar a AMI"
  value       = module.ec2-update.vm-1-id
}