output "redis-sentinel-setup-redis-sentinel-setup-id" {
  description = "ID do Redis Sentinel base para criar a AMI"
  value       = module.redis-sentinel-setup.redis-sentinel-setup-id
}

output "redis-sentinel-setup-redis-sentinel-setup-public-ip" {
  description = "IP público do Redis Sentinel base para criar a AMI"
  value       = module.redis-sentinel-setup.redis-sentinel-setup-public-ip
}