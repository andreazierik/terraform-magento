resource "aws_instance" "vm-1" {
  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  # Odoo preconfigurado
  ami           = data.terraform_remote_state.remote-ami.outputs.ami-ec2-ami-id
  instance_type = "t3a.large"
  key_name      = "aws-dev-console-admin"
  subnet_id     = data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-subnet-public-1a-id

  root_block_device {
    volume_size = 30
  }

  vpc_security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-vpc-1-sg-allow-all-id
  ]
  associate_public_ip_address = true

  user_data_replace_on_change = true
  user_data = templatefile(
    "${path.module}/userdata-update-magento.tftpl", {
    }
  )

  tags = {
    Name = "vm-magento-update"
  }
}