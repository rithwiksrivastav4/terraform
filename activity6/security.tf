resource "aws_security_group" "base" {
  vpc_id = aws_vpc.base.id
  name   = var.web_security_group.name
  tags = {
    Name = var.web_security_group.name
  }
  depends_on = [aws_vpc.base]
}




resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = length(var.web_security_group.rules)
  security_group_id = aws_security_group.base.id
  cidr_ipv4         = var.web_security_group.rules[count.index].cidr_ipv4
  from_port         = var.web_security_group.rules[count.index].from_port
  to_port           = var.web_security_group.rules[count.index].to_port
  ip_protocol       = var.web_security_group.rules[count.index].ip_protocol

}

resource "aws_vpc_security_group_egress_rule" "base" {
  count             = length(var.web_security_group.rules)
  security_group_id = aws_security_group.base.id
  cidr_ipv4         = var.web_security_group.rules[count.index].cidr_ipv4
  ip_protocol       = "-1"

}
