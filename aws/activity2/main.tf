resource "aws_vpc" "network" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "net"  
  }
}

resource "aws_subnet" "web" {
  cidr_block        = "10.0.0.0/24"
  vpc_id            = aws_vpc.network.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = "web1"
  }
  depends_on = [
    aws_vpc.network
  ]
}

resource "aws_subnet" "app" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.network.id
  availability_zone = "ap-south-1b"
  tags = {
    Name = "app-1"
  }
  depends_on = [
    aws_vpc.network
  ]
}

resource "aws_subnet" "db" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.network.id
  availability_zone = "ap-south-1c"
  tags = {
    Name = "db"
  }
  depends_on = [
    aws_vpc.network
  ]
}