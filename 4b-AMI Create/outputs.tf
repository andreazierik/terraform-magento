output "ami-ec2-ami-id" {
  description = "ID da AMI criada com a versao base"
  value       = module.ami.ec2-ami-id
}