

resource "aws_db_subnet_group" "z_project" {
  name       = "z-project"
  subnet_ids = aws_subnet.private_subnet.*.id

  tags = {
    Name = "z-project db subnet group"
  }
}

resource "aws_db_parameter_group" "z_project" {
  name   = "z-project"
  family = "mariadb10.5"

  # parameter {
  #   name  = "log_connections"
  #   value = "1"
  # }
}

resource "aws_db_instance" "rds" {
  count                  = 1
  identifier             = "rds"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "MariaDB"
  engine_version         = "10.5"
  username               = "devops"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.z_project.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  parameter_group_name   = aws_db_parameter_group.z_project.name
  publicly_accessible    = false
  skip_final_snapshot    = true
}
