output "redis-ami-id" {
  value = aws_ami_from_instance.redis-ami.id
}