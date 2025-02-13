data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "defasub" {
  depends_on = [data.aws_vpc.default]
}
data "aws_security_group" "defsg" {
  depends_on = [data.aws_vpc.default]
}