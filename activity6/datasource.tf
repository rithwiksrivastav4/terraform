data "aws_ami" "webimage" {
  most_recent = true



  filter {
    name   = "name"
    values = [var.web_server.ami_filter.name]

  }
  owners = [var.web_server.ami_filter.owner]
}