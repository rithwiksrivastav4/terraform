resource "aws_instance" "web" {
  ami                         = var.web_server.ami
  instance_type               = var.web_server.instance_type
  associate_public_ip_address = var.web_server.associate_public_ip_address
  key_name                    = var.key_pair_path.name
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    Name = var.web_server.name
  }
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.base.id]
  depends_on = [
    aws_key_pair.mykeypair,
    aws_subnet.public,
    aws_security_group.base
  ]
}