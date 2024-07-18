resource "aws_opensearch_domain" "opensearch-1" {
  
  domain_name = "opensearch-${var.shortnameid}-1"
  
  cluster_config {
    instance_type = "t3.small.search"
    instance_count = 2
    dedicated_master_enabled = true
    dedicated_master_type = "t3.small.search"
    dedicated_master_count = 3
    zone_awareness_enabled = true
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
    volume_type = "gp3"
  }

  vpc_options {
    subnet_ids = [
      data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1a-id,
      data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1b-id      
    ]
    security_group_ids = [
      data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-opensearch-1-id
    ]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  tags = {
    Name = "opensearch-${var.shortnameid}-1"
  }
  
}