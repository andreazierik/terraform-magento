# VPC 1 Information
output "vpc-1-name" {
  description = "Nome da VPC-1"
  value       = aws_vpc.vpc-1.tags["Name"]
}

output "vpc-1-id" {
  description = "ID da VPC-1"
  value       = aws_vpc.vpc-1.id
}

output "subnet-vpc-1-public-1a-id" {
  description = "VPC-1: ID da subnet publica 1a"
  value       = aws_subnet.subnet-vpc-1-public-1a.id
}

output "subnet-vpc-1-public-1b-id" {
  description = "VPC-1: ID da subnet publica 1b"
  value       = aws_subnet.subnet-vpc-1-public-1b.id
}

output "subnet-vpc-1-public-1c-id" {
  description = "VPC-1: ID da subnet publica 1c"
  value       = aws_subnet.subnet-vpc-1-public-1c.id
}

output "subnet-vpc-1-private-1a-id" {
  description = "VPC-1: ID da subnet privada 1a"
  value       = aws_subnet.subnet-vpc-1-private-1a.id
}

output "subnet-vpc-1-private-1b-id" {
  description = "VPC-1: ID da subnet privada 1b"
  value       = aws_subnet.subnet-vpc-1-private-1b.id
}

output "subnet-vpc-1-private-1c-id" {
  description = "VPC-1: ID da subnet privada 1c"
  value       = aws_subnet.subnet-vpc-1-private-1c.id
}

output "sg-vpc-1-allow-all-id" {
  description = "VPC-1: Security group tudo liberado ID"
  value       = aws_security_group.sg-vpc-1-allow-all.id
}

output "sg-vpc-1-allow-all-name" {
  description = "VPC-1: Security group tudo liberado Name"
  value       = aws_security_group.sg-vpc-1-allow-all.name
}

output "sg-vpc-1-alb-1-tgrp-1-id" {
  description = "VPC-1: Security group para instancias no Target group1 do ALB 1, ID"
  value       = aws_security_group.sg-vpc-1-alb-1-tgrp-1.id
}

output "sg-vpc-1-alb-1-tgrp-1-name" {
  description = "VPC-1: Security group para instancias no Target group 1 do ALB 1, Name"
  value       = aws_security_group.sg-vpc-1-alb-1-tgrp-1.name
}

output "sg-vpc-1-rds-1-id" {
  description = "VPC-1: Security group para RDS 1, ID"
  value       = aws_security_group.sg-vpc-1-rds-1.id
}

output "sg-vpc-1-rds-1-name" {
  description = "VPC-1: Security group para RDS 1, Name"
  value       = aws_security_group.sg-vpc-1-rds-1.name
}

output "sg-vpc-1-efs-1-mountpoints-id" {
  description = "VPC-1: Security group para EFS 1 mount points, ID"
  value       = aws_security_group.sg-vpc-1-efs-1-mountpoints.id
}

output "sg-vpc-1-efs-1-mountpoints-name" {
  description = "VPC-1: Security group para EFS 1 mount points, Name"
  value       = aws_security_group.sg-vpc-1-efs-1-mountpoints.name
}

output "sg-vpc-1-alb-1-id" {
  description = "VPC-1: Security group para ALB 1, ID"
  value       = aws_security_group.sg-vpc-1-alb-1.id
}

output "sg-vpc-1-alb-1-name" {
  description = "VPC-1: Security group para ALB 1, Name"
  value       = aws_security_group.sg-vpc-1-alb-1.name
}

output "sg-vpc-1-nlb-1-id" {
  value = aws_security_group.sg-vpc-1-nlb-1.id
}

output "sg-vpc-1-nlb-1-name" {
  value = aws_security_group.sg-vpc-1-nlb-1.name
}

output "sg-vpc-1-nlb-2-id" {
  value = aws_security_group.sg-vpc-1-nlb-2.id
}

output "sg-vpc-1-nlb-2-name" {
  value = aws_security_group.sg-vpc-1-nlb-2.name
}

output "sg-vpc-1-nlb-1-tgrp-1-id" {
  value = aws_security_group.sg-vpc-1-nlb-1-tgrp-1.id
}

output "sg-vpc-1-nlb-1-tgrp-1-name" {
  value = aws_security_group.sg-vpc-1-nlb-1-tgrp-1.name
}

output "sg-vpc-1-nlb-2-tgrp-1-id" {
  value = aws_security_group.sg-vpc-1-nlb-2-tgrp-1.id
}

output "sg-vpc-1-nlb-2-tgrp-1-name" {
  value = aws_security_group.sg-vpc-1-nlb-2-tgrp-1.name
}

output "sg-vpc-1-opensearch-1-id" {
  value = aws_security_group.sg-vpc-1-opensearch-1.id
}

output "sg-vpc-1-opensearch-1-name" {
  value = aws_security_group.sg-vpc-1-opensearch-1.name
}

output "sg-vpc-1-elasticcache-1-id" {
  value = aws_security_group.sg-vpc-1-elasticcache-1.id
}

output "sg-vpc-1-elasticcache-1-name" {
  value = aws_security_group.sg-vpc-1-elasticcache-1.name
}

