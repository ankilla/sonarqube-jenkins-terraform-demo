resource "aws_security_group" "allow_http_ssh" {
  name_prefix        = "allow-http-ssh"
  description = "Allow Ingress rules to allow SSH and HTTP connections"
}