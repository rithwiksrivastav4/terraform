resource "aws_vpc" "net" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ntire"
  }
}

resource "aws_subnet" "subnets" {
  count             = 4
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  vpc_id            = aws_vpc.net.id
  tags = {
    Name = var.subnets_names[count.index]
  }
  depends_on = [aws_vpc.net]
}
