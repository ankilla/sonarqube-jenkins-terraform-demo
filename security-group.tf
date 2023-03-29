resource "aws_security_group" "allow_http_ssh" {
  name        = "allow-http-ssh"
  description = "Allow Ingress rules to allow SSH and HTTP connections"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow Ingress rules to allow HTTP and SSH connections"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}