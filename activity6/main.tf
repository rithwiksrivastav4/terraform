resource "aws_vpc" "base" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }

}

resource "aws_internet_gateway" "base" {

  vpc_id = aws_vpc.base.id

  tags = {
    Name = var.igwn
  }

  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.base.id

  tags = {
    Name = var.rtn[0]
  }

  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.base.id

  route {
    cidr_block = var.route
    gateway_id = aws_internet_gateway.base.id
  }

  tags = {
    Name = var.rtn[1]
  }

  depends_on = [
    aws_vpc.base,
    aws_internet_gateway.base
  ]

}


resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.azs[0]
  cidr_block        = var.subnet_cidrs[0]
  tags = {
    Name = var.subnet_names[0]
  }

  depends_on = [aws_vpc.base]

}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.base.id
  availability_zone = var.azs[1]
  cidr_block        = var.subnet_cidrs[1]
  tags = {
    Name = var.subnet_names[1]
  }

  depends_on = [aws_vpc.base]

}


resource "aws_route_table_association" "private" {

  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public.id
}