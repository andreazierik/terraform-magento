// Criar AMI
resource "aws_ami_from_instance" "ec2-ami" {
  name                    = "terraform-ami-magento-v1"
  source_instance_id      = data.terraform_remote_state.remote-state-base-ec2.outputs.ec2-base-ami-id
  snapshot_without_reboot = true

  tags = {
    Name = "terraform-ami-magento-v1"
  }
}