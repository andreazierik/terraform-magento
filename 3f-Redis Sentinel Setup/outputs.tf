output "redis-setup-redis-setup-id" {
  description = "ID do Redis base para criar a AMI"
  value       = module.redis-setup.redis-setup-id
}

output "redis-setup-redis-setup-public-ip" {
  description = "IP público do Redis base para criar a AMI"
  value       = module.redis-setup.redis-setup-public-ip
}