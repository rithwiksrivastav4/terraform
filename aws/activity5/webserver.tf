resource "aws_instance" "web" {
  ami                         = data.aws_ami.webimage.id
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
    Name = var.tags
  }
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.base.id]
  depends_on = [
    aws_key_pair.mykeypair,
    aws_subnet.public,
    aws_security_group.base,
    data.aws_ami.webimage
  ]
}

resource "null_resource" "triggers" {
  triggers = {
    build_id = var.build_id
  }

  connection {
    type        = "ssh"
    user        = var.web_server.username
    private_key = file(var.key_pair_path.private_key_path)
    host        = aws_instance.web.public_ip
  }
  provisioner "remote-exec" {
    script = "./install.sh"

  }

}