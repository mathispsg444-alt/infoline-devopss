provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "infoline_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "infoline_subnet" {
  vpc_id            = aws_vpc.infoline_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_security_group" "infoline_sg" {
  vpc_id = aws_vpc.infoline_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "infoline_server" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu (à adapter selon région)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.infoline_subnet.id
  vpc_security_group_ids = [aws_security_group.infoline_sg.id]

  tags = {
    Name = "Infoline-Server"
  }
}

