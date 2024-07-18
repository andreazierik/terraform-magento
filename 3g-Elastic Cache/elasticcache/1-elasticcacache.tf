resource "aws_elasticache_subnet_group" "subnet-group-elasticcache-1" {
  name = "subnet-group-elasticcache-redis-1"
  subnet_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1a-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1b-id
  ]
}

resource "aws_elasticache_parameter_group" "parameter-group-elasticcache-1" {
  name = "param-group-elasticcache-redis-1"
  family = "redis6.x"
  description = "Paramenter group para Magento com Redis"

  parameter {
    name = "maxmemory-policy"
    value = "allkey-lru"
  }
}