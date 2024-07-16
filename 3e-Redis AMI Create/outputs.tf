output "redis-ami-redis-ami-id" {
  description = "ID da AMI criada com a versao Redis base"
  value       = module.redis-ami.redis-ami-id
}