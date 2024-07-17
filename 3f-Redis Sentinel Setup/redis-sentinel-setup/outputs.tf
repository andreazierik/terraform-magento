output "redis-sentinel-setup-id" {
  value = aws_instance.redis-sentinel-setup.id
}

output "redis-sentinel-setup-public-ip" {
  value = aws_instance.redis-sentinel-setup.public_ip
}