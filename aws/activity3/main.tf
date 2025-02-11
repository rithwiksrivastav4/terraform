resource "aws_vpc" "net" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ntire"
  }
}

resource "aws_subnet" "sub1" {
  cidr_block        = var.subnet_cidrs[0]
  availability_zone = var.azs[0]
  vpc_id            = aws_vpc.net.id
  tags = {
    Name = "web1"
  }
  depends_on = [aws_vpc.net]
}

resource "aws_subnet" "sub2" {
  cidr_block        = var.subnet_cidrs[1]
  availability_zone = var.azs[1]
  vpc_id            = aws_vpc.net.id
  tags = {
    Name = "web-11"
  }
  depends_on = [aws_vpc.net]
}

resource "aws_subnet" "sub3" {
  cidr_block        = var.subnet_cidrs[2]
  availability_zone = var.azs[2]
  vpc_id            = aws_vpc.net.id
  tags = {
    Name = "app1"
  }
  depends_on = [aws_vpc.net]
}

resource "aws_subnet" "sub4" {
  cidr_block        = var.subnet_cidrs[3]
  availability_zone = var.azs[3]
  vpc_id            = aws_vpc.net.id
  tags = {
    Name = "app-11"
  }
  depends_on = [aws_vpc.net]
}