resource "aws_instance" "web" {
  ami                         = var.image_id     #"ami-007855ac798b5175e"
  instance_type               = var.inst_type[1] // or var.inst_type[0], var.inst_type[2]
  count                       = var.inst_count
  availability_zone           = "us-east-1c"
  key_name                    = "ec2demo"
  

  tags = var.ec2_instance_tags
}
