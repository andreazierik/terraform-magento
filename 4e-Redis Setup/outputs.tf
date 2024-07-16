output "ec2-setup-ec2-setup-id" {
  description = "ID do Redis base para criar a AMI"
  value       = module.ec2-setup.ec2-setup-id
}

output "ec2-setup-ec2-setup-public-ip" {
  description = "IP público do Redis base para criar a AMI"
  value       = module.ec2-setup.ec2-setup-public-ip
}