resource "aws_instance" "web" {
  ami                         = "ami-00bb6a80f01f03502"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = var.key_pair_path.name
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    Name = "my-instance"
  }
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.base.id]
  depends_on = [
    aws_key_pair.mykeypair,
    aws_subnet.public,
    aws_security_group.base
  ]
}