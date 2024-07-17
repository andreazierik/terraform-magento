resource "aws_instance" "redis-sentinel-setup" {
  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  ami           = "ami-04b70fa74e45c3917"
  # instance_type = "t3a.large"
  instance_type = "t3.micro"
  #key_name      = "aws-dev-console-admin"
  key_name      = "aws-services-ec2-ssh"
  subnet_id     = data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-public-1a-id

  root_block_device {
    volume_size = 10
  }

  vpc_security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-allow-all-id
  ]
  associate_public_ip_address = true

  user_data_replace_on_change = true
  user_data = templatefile(
    "${path.module}/userdata-setup-redis-sentinel.tftpl", {
      redis-password = "${var.redis-password}"
    }
  )

  provisioner "remote-exec" {
    connection {
      type    = "ssh"
      user    = "ubuntu"
      host    = self.public_ip
      timeout = 600
    }

    inline = [
      "while [ ! -f /tmp/userdata_finished ]; do",
      "tail -n 10 /var/log/cloud-init-output.log",
      "sleep 15",
      "done"
    ]
  }

  tags = {
    Name = "${var.shortnameid}-redis-sentinel-setup"
  }
}