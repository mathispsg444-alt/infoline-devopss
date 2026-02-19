resource "aws_vpc" "infoline_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "infoline-vpc"
  }
}
