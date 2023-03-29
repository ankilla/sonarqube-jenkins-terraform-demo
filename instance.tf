resource "aws_instance" "web" {
  ami                         = var.image_id     #"ami-007855ac798b5175e"
  instance_type               = var.inst_type[1] // or var.inst_type[0], var.inst_type[2]
  count                       = var.inst_count
  availability_zone           = "us-east-1c"
  key_name                    = "ec2demo"
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]


connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("ec2demo.pem")
    timeout  = "5m"
    host = self.public_ip
  }


provisioner "remote-exec" {
    inline = [
        "sudo apt update && apt -y dist-upgrade",
        "sudo apt install -y nginx",
        "sudo systemctl enable nginx",
        "sudo systemctl start nginx",
        "sudo echo '<h1>Nginx was deployed successful using terraform $(hostname -f)</h1>' > /usr/share/nginx/html/index.html",
        "sudo echo '<h1>Nginx was deployed successful using terraform $(hostname -f)</h1>' > /var/www/html/index.html"
    ]
}
  tags = var.ec2_instance_tags
}