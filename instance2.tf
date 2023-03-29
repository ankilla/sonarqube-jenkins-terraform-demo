resource "aws_instance" "web" {
  ami                         = var.image_id     #"ami-007855ac798b5175e"
  instance_type               = var.inst_type[1] // or var.inst_type[0], var.inst_type[2]
  count                       = var.inst_count
  availability_zone           = "us-east-1c"
  key_name                    = "ec2demo"
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]


user_data = <<-EOF
                #!/bin/bash
                sudo apt update && apt -y dist-upgrade
                sudo apt install -y nginx
                sudo systemctl enable nginx
                sudo systemctl start nginx
                echo "<h1>Nginx was deployed successful using terraform by Jenkins CI-CD using Method 2</h1>" > /usr/share/nginx/html/index.html
                echo "<h1>Nginx was deployed successful using terraform by Jenkins CI-CD using Method 2</h1>" > /var/www/html/index.html
              EOF

  tags = var.ec2_instance_tags
}