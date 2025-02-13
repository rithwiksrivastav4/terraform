resource "aws_db_instance" "nop" {
  allocated_storage      = var.db_info.allocated_storage
  vpc_security_group_ids = [data.aws_security_group.defsg.id]
  instance_class         = var.db_info.instance_class
  publicly_accessible    = var.db_info.public
  engine                 = var.db_info.engine
  username               = var.db_info.username
  password               = var.db_info.password
  skip_final_snapshot    = true
}