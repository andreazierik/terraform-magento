output "redis-setup-id" {
  value = aws_instance.redis-setup.id
}

output "redis-setup-public-ip" {
  value = aws_instance.redis-setup.public_ip
}