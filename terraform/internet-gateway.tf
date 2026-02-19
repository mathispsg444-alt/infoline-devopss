resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.infoline_vpc.id

  tags = {
    Name = "infoline-gateway"
  }
}
