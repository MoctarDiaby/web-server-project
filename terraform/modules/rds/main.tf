resource "aws_db_instance" "wordpress_db" {
  allocated_storage    = 20
  db_instance_class    = "db.t3.micro"
  engine              = "mysql"
  engine_version      = "8.0"
  identifier          = "wordpress-db"
  username           = "admin"
  password           = "password"
  publicly_accessible = false
  skip_final_snapshot = true
}
