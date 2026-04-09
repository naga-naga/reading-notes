provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sample-vpc"
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.0.0/20"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "sample-subnet-public01"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.16.0/20"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "sample-subnet-public02"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.64.0/20"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "sample-subnet-private01"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.main.id

  cidr_block        = "10.0.80.0/20"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "sample-subnet-private02"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "sample-igw"
  }
}

resource "aws_eip" "nat_1a" {
  domain = "vpc"

  tags = {
    Name = "sample-eip-01"
  }
}

resource "aws_eip" "nat_1c" {
  domain = "vpc"

  tags = {
    Name = "sample-eip-02"
  }
}

resource "aws_nat_gateway" "nat_1a" {
  allocation_id     = aws_eip.nat_1a.id
  subnet_id         = aws_subnet.public_1a.id
  connectivity_type = "public"

  tags = {
    Name = "sample-ngw-01"
  }
}

resource "aws_nat_gateway" "nat_1c" {
  allocation_id     = aws_eip.nat_1c.id
  subnet_id         = aws_subnet.public_1c.id
  connectivity_type = "public"

  tags = {
    Name = "sample-ngw-02"
  }
}
