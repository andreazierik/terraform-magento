resource "aws_elasticache_subnet_group" "subnet-group-elasticcache-1" {
  name = "subnet-group-elasticcache-redis-1"
  subnet_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1a-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1b-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1c-id
  ]
}

resource "aws_elasticache_parameter_group" "parameter-group-elasticcache-1" {
  name        = "param-group-elasticcache-redis-1"
  family      = "redis7"
  description = "Paramenter group para Magento com Redis"

  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }
}

resource "aws_elasticache_cluster" "elasticcache-1" {
  depends_on           = [aws_elasticache_subnet_group.subnet-group-elasticcache-1]
  cluster_id           = "redis-cluster-1"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "param-group-elasticcache-redis-1"
  subnet_group_name    = "subnet-group-elasticcache-redis-1"
  security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-elasticcache-1-id
  ]
  port = 6379

  tags = {
    Name = "elasticcache-${var.shortnameid}-redis-1"
  }
}