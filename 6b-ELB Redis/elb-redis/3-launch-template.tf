// Launch template Redis Master
resource "aws_launch_template" "ltplt-nlb-1-trgp-1" {

  name                   = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-master-1"
  update_default_version = true

  // AMI
  image_id = data.terraform_remote_state.remote-redis-ami.outputs.redis-ami-redis-ami-id

  // Instance type
  # instance_type = "c7a.medium"
  instance_type = "t3.micro"

  // Key pair (login)
  # key_name = "aws-dev-console-admin"
  key_name = "aws-services-ec2-ssh"

  // Network settings
  vpc_security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-nlb-1-tgrp-1-id
  ]

  // Resource tags
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-master-1"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-master-1-ebs"
    }
  }

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-master-1-eni"
    }
  }

  // Advanced details
  instance_initiated_shutdown_behavior = "terminate"

  monitoring {
    enabled = true
  }

  user_data = templatefile(
    "${path.module}/userdata-redis-master.tftpl", {
      master-dns = aws_lb.nlb-1.dns_name
    }
  )

  // ebs_optimized = true

  tags = {
    Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-master-1"
  }
}

// Launch template Redis Replica
resource "aws_launch_template" "ltplt-nlb-1-trgp-2" {

  name                   = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-replica-2"
  update_default_version = true

  // AMI
  image_id = data.terraform_remote_state.remote-redis-ami.outputs.redis-ami-redis-ami-id

  // Instance type
  # instance_type = "c7a.medium"
  instance_type = "t3.micro"

  // Key pair (login)
  # key_name = "aws-dev-console-admin"
  key_name = "aws-services-ec2-ssh"

  // Network settings
  vpc_security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-nlb-1-tgrp-2-id
  ]

  // Resource tags
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-replica-2"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-replica-2-ebs"
    }
  }

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-replica-2-eni"
    }
  }

  // Advanced details
  instance_initiated_shutdown_behavior = "terminate"

  monitoring {
    enabled = true
  }

  user_data = templatefile(
    "${path.module}/userdata-redis-replica.tftpl", {
      master-dns = aws_lb.nlb-1.dns_name,
      redis-password = var.redis-password
    }
  )

  // ebs_optimized = true

  tags = {
    Name = "ltplt-${var.shortnameid}-nlb-1-trgp-redis-replica-2"
  }
}

