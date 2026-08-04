resource "aws_db_subnet_group" "main" {
  name       = "ivolve-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "ivolve-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "ivolve-rds-sg"
  description = "Allow MySQL traffic from EKS worker nodes only"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.eks_node_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ivolve-rds-sg"
  }
}

resource "aws_db_instance" "mysql" {
  identifier             = "ivolve-mysql-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro" 
  allocated_storage      = 20             
  storage_type           = "gp3"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  multi_az               = false          
  publicly_accessible    = false
}