output "ami-updated-ami-id" {
  description = "ID da AMI criada com a versao base"
  value       = module.ami.updated-ami-id
}