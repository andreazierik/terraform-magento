# VPC 1 Information
output "vpcs-vpc-1-name" {
  description = "Nome da VPC-1"
  value       = module.vpcs.vpc-1-name
}

output "vpcs-vpc-1-id" {
  description = "ID da VPC-1"
  value       = module.vpcs.vpc-1-id
}

output "vpcs-subnet-vpc-1-public-1a-id" {
  description = "VPC-1: ID da subnet publica 1a"
  value       = module.vpcs.subnet-vpc-1-public-1a-id
}

output "vpcs-subnet-vpc-1-public-1b-id" {
  description = "VPC-1: ID da subnet publica 1b"
  value       = module.vpcs.subnet-vpc-1-public-1b-id
}

output "vpcs-subnet-vpc-1-public-1c-id" {
  description = "VPC-1: ID da subnet publica 1c"
  value       = module.vpcs.subnet-vpc-1-public-1c-id
}

output "vpcs-subnet-vpc-1-private-1a-id" {
  description = "VPC-1: ID da subnet privada 1a"
  value       = module.vpcs.subnet-vpc-1-private-1a-id
}

output "vpcs-subnet-vpc-1-private-1b-id" {
  description = "VPC-1: ID da subnet privada 1b"
  value       = module.vpcs.subnet-vpc-1-private-1b-id
}

output "vpcs-subnet-vpc-1-private-1c-id" {
  description = "VPC-1: ID da subnet privada 1c"
  value       = module.vpcs.subnet-vpc-1-private-1c-id
}

output "vpcs-sg-vpc-1-allow-all-id" {
  description = "VPC-1: Security group tudo liberado, ID"
  value       = module.vpcs.sg-vpc-1-allow-all-id
}

output "vpcs-sg-vpc-1-allow-all-name" {
  description = "VPC-1: Security group tudo liberado, Name"
  value       = module.vpcs.sg-vpc-1-allow-all-name
}

output "vpcs-sg-vpc-1-alb-1-tgrp-1-id" {
  description = "VPC-1: Security group para instancias no Target group1 do ALB 1, ID"
  value       = module.vpcs.sg-vpc-1-alb-1-tgrp-1-id
}

output "vpcs-sg-vpc-1-alb-1-tgrp-1-name" {
  description = "VPC-1: Security group para instancias no Target group 1 do ALB 1, Name"
  value       = module.vpcs.sg-vpc-1-alb-1-tgrp-1-name
}

output "vpcs-sg-vpc-1-rds-1-id" {
  description = "VPC-1: Security group para RDS 1, ID"
  value       = module.vpcs.sg-vpc-1-rds-1-id
}

output "vpcs-sg-vpc-1-rds-1-name" {
  description = "VPC-1: Security group para RDS 1, Name"
  value       = module.vpcs.sg-vpc-1-rds-1-name
}

output "vpcs-sg-vpc-1-efs-1-mountpoints-id" {
  description = "VPC-1: Security group para EFS 1 mount points, ID"
  value       = module.vpcs.sg-vpc-1-efs-1-mountpoints-id
}

output "vpcs-sg-vpc-1-efs-1-mountpoints-name" {
  description = "VPC-1: Security group para EFS 1 mount points, Name"
  value       = module.vpcs.sg-vpc-1-efs-1-mountpoints-name
}

output "vpcs-sg-vpc-1-alb-1-id" {
  description = "VPC-1: Security group para ALB 1, ID"
  value       = module.vpcs.sg-vpc-1-alb-1-id
}

output "vpcs-sg-vpc-1-alb-1-name" {
  description = "VPC-1: Security group para ALB 1, Name"
  value       = module.vpcs.sg-vpc-1-alb-1-name
}

output "vpcs-sg-vpc-1-nlb-1-id" {
  description = "VPC-1: Security group para NLB 1, Redis Master, ID"
  value       = module.vpcs.sg-vpc-1-nlb-1-id
}

output "vpcs-sg-vpc-1-nlb-1-name" {
  description = "VPC-1: Security group para NLB 1, Redis Master, Name"
  value       = module.vpcs.sg-vpc-1-nlb-1-name
}

output "vpcs-sg-vpc-1-nlb-2-id" {
  description = "VPC-1: Security group para NLB 2, Redis Replica, ID"
  value       = module.vpcs.sg-vpc-1-nlb-2-id
}

output "vpcs-sg-vpc-1-nlb-2-name" {
  description = "VPC-1: Security group para NLB 2, Redis Replica, Name"
  value       = module.vpcs.sg-vpc-1-nlb-2-name
}

output "vpcs-sg-vpc-1-nlb-1-tgrp-1-id" {
  description = "VPC-1: Security group para instancias no Target group 1, Redis Master,  do NLB 1, ID"
  value       = module.vpcs.sg-vpc-1-nlb-1-tgrp-1-id
}

output "vpcs-sg-vpc-1-nlb-1-tgrp-1-name" {
  description = "VPC-1: Security group para instancias no Target group 1, Redis Master, do NLB 1, Name"
  value       = module.vpcs.sg-vpc-1-nlb-1-tgrp-1-name
}

output "vpcs-sg-vpc-1-nlb-2-tgrp-1-id" {
  description = "VPC-1: Security group para instancias no Target group 1, Redis Replica,  do NLB 2, ID"
  value       = module.vpcs.sg-vpc-1-nlb-2-tgrp-1-id
}

output "vpcs-sg-vpc-1-nlb-2-tgrp-1-name" {
  description = "VPC-1: Security group para instancias no Target group 1, Redis Replica, do NLB 2, Name"
  value       = module.vpcs.sg-vpc-1-nlb-2-tgrp-1-name
}

output "vpcs-sg-vpc-1-opensearch-1-id" {
  description = "VPC-1: Security group para instancias no Open Search 1, ID"
  value       = module.vpcs.sg-vpc-1-opensearch-1-id
}

output "vpcs-sg-vpc-1-opensearch-1-name" {
  description = "VPC-1: Security group para instancias no Open Search 1, Name"
  value       = module.vpcs.sg-vpc-1-opensearch-1-name
}

output "vpcs-sg-vpc-1-elasticcache-1-id" {
  description = "VPC-1: Security group para instancias no Elastic Cache 1, ID"
  value       = module.vpcs.sg-vpc-1-elasticcache-1-id
}

output "vpcs-sg-vpc-1-elasticcache-1-name" {
  description = "VPC-1: Security group para instancias no Elastic Cache 1, Name"
  value       = module.vpcs.sg-vpc-1-elasticcache-1-name
}