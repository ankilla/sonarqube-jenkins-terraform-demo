resource "aws_security_group" "allow_http_ssh" {
  name_prefix = "allow_http_ssh"
  description = "Allow SSH and HTTP traffic"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.allow_http_ssh.id
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.allow_http_ssh.id
  }
}