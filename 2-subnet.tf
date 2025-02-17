resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "10.0.2.0/24 - eu-west-2a"
  }
}
