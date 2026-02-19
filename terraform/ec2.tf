resource "aws_instance" "infoline_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (eu-west-1)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.infoline_sg.id]

  tags = {
    Name = "infoline-ec2"
  }
}
