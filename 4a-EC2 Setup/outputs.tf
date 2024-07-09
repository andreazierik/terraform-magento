output "ec2-base-ami-id" {
  description = "ID da EC2 base para criar a AMI"
  value       = module.ec2-setup.vm-1-id
}

output "ec2-base-ami-public-ip" {
  description = "IP público da EC2 base para criar a AMI"
  value       = module.ec2-setup.vm-1-public-ip
}