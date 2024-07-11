resource "aws_db_subnet_group" "subnet-group-rds-1" {
  name = "subnet-group-rds-${shortnameid}-1"
  subnet_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1a-id,
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-subnet-vpc-1-private-1b-id
  ]

  tags = {
    Name = "subnet-group-rds-${shortnameid}-1"
  }
}

resource "aws_db_instance" "rds-1" {
  allocated_storage    = 20
  db_name              = "magentodb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "magentoadmin"
  password             = "pass123456789"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.subnet-group-rds-1.name
  skip_final_snapshot  = true
  multi_az             = false

  vpc_security_group_ids = [
    data.terraform_remote_state.remote-state-vpc.outputs.vpcs-sg-vpc-1-rds-1-id
  ]

  tags = {
    Name = "rds-${shortnameid}-1"
  }
}