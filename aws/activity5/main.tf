resource "aws_vpc" "base" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = var.network_name
  }

}

resource "aws_internet_gateway" "base" {

  vpc_id = aws_vpc.base.id

  tags = {
    Name = "${var.network_name}-igwn"
  }

  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "private" {
  count  = local.private_subnets_count != 0 ? 1 : 0
  vpc_id = aws_vpc.base.id

  tags = {
    Name = "${var.network_name}-private"
  }

  depends_on = [aws_vpc.base]

}

resource "aws_route_table" "public" {
  count  = local.public_subnets_count != 0 ? 1 : 0
  vpc_id = aws_vpc.base.id

  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.base.id
  }

  tags = {
    Name = "${var.network_name}-public"
  }

  depends_on = [
    aws_vpc.base,
    aws_internet_gateway.base
  ]

}


resource "aws_subnet" "public" {
  count             = local.public_subnets_count
  vpc_id            = aws_vpc.base.id
  availability_zone = var.public_subnets[count.index].az
  cidr_block        = var.public_subnets[count.index].cidr
  tags = {
    Name = var.public_subnets[count.index].name
  }

  depends_on = [aws_vpc.base]

}

resource "aws_subnet" "private" {
  count             = local.private_subnets_count
  vpc_id            = aws_vpc.base.id
  availability_zone = var.private_subnets[count.index].az
  cidr_block        = var.private_subnets[count.index].cidr
  tags = {
    Name = var.private_subnets[count.index].name
  }

  depends_on = [aws_vpc.base]

}


resource "aws_route_table_association" "private" {
  count          = local.private_subnets_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id

}

resource "aws_route_table_association" "public" {
  count          = local.public_subnets_count
  route_table_id = aws_route_table.public[0].id
  subnet_id      = aws_subnet.public[count.index].id
}
