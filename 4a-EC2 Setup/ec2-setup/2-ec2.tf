resource "aws_instance" "ec2-setup" {
  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "c7a.large"
  # instance_type = "t3a.large"
  # instance_type = "t3.micro"
  key_name             = "estudos"
  subnet_id            = data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-public-1a-id
  # iam_instance_profile = aws_iam_instance_profile.magento-instance-profile.name
  iam_instance_profile = data.terraform_remote_state.remote-state-s3-static-files.outputs.s3-static-files-magento-ec2-s3-profile-name

  root_block_device {
    volume_size = 20
  }

  vpc_security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-allow-all-id
  ]
  associate_public_ip_address = true

  user_data_replace_on_change = true
  user_data = templatefile(
    "${path.module}/userdata-setup-magento.tftpl", {
      domain-base             = var.domain-base,
      rds-1-endpoint          = split(":", data.terraform_remote_state.remote-state-rds.outputs.rds-rds-1-endpoint)[0],
      rds-1-db-name           = var.rds-1-db-name,
      rds-1-db-username       = var.rds-1-db-username,
      rds-1-db-password       = var.rds-1-db-password,
      magento-public-key      = var.magento-public-key,
      magento-private-key     = var.magento-private-key,
      magento-admin-email     = var.magento-admin-email,
      magento-admin-firstname = var.magento-admin-firstname,
      magento-admin-lastname  = var.magento-admin-lastname,
      magento-admin-user      = var.magento-admin-user,
      magento-admin-password  = var.magento-admin-password,
      # opensearch-endpoint     = data.terraform_remote_state.remote-state-opensearch.outputs.opensearch-opensearch-1-endpoint,
      opensearch-endpoint     = "vpc-opensearch-magento-1-hkcbctpzhco4i3plc3fcsk2w7a.us-east-1.es.amazonaws.com"
      redis-endpoint           = data.terraform_remote_state.remote-state-elasticcache.outputs.elasticcache-elasticcache-1-cache-nodes-0-address,
      static-files-bucket-name = data.terraform_remote_state.remote-state-s3-static-files.outputs.s3-static-files-magento-static-files-bucket,
      efs-dns-name             = data.terraform_remote_state.remote-state-efs.outputs.efs-efs-1-dns-name
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
    Name = "${var.shortnameid}-setup"
  }
}