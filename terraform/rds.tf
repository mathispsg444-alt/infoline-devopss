resource "aws_db_instance" "infoline_db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Password123!"
  skip_final_snapshot  = true

  tags = {
    Name = "infoline-postgres"
  }
}
