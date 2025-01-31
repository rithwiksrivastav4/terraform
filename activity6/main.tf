resource "aws_vpc" "base" {

  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "ntire"
  }

}

resource "aws_internet_gateway" "base" {

  vpc_id = aws_vpc.base.id

  tags = {
    Name = "ntire-igw"
  }

  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.base.id

  tags = {
    Name = "ntire-private"
  }

  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.base.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.base.id
  }

  tags = {
    Name = "ntire-public"
  }

  depends_on = [
    aws_vpc.base,
    aws_internet_gateway.base
  ]

}


resource "aws_subnet" "private" {

  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.10.0.0/24"
  tags = {
    Name = "private-sub"
  }

  depends_on = [aws_vpc.base]

}


resource "aws_route_table_association" "private" {

  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

}


resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.base.id
  availability_zone = "ap-south-1b"
  cidr_block        = "10.10.1.0/24"

  tags = {
    Name = "public-sub"
  }

  depends_on = [aws_vpc.base]

}



resource "aws_route_table_association" "public" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public.id
}