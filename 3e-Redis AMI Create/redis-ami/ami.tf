// Criar AMI
resource "aws_ami_from_instance" "redis-ami" {
  name                    = "ami-terraform-${var.shortnameid}-redis-v1"
  source_instance_id      = data.terraform_remote_state.remote-state-redis-setup.outputs.redis-setup-redis-setup-id
  snapshot_without_reboot = true

  tags = {
    Name = "ami-terraform-${var.shortnameid}-redis-v1"
  }
}