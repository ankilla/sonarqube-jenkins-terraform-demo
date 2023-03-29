provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "example" {
  name_prefix = "example"
  description = "Allow SSH and HTTP traffic"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.example.name]
  
  tags = {
    Name = "example-instance"
  }
}
