output "ec2-ami-id" {
  value = aws_ami_from_instance.ec2-ami.id
}