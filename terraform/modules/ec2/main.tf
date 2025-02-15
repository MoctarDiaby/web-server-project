resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = module.networking.public_subnet_id
  security_groups        = [module.networking.web_sg]
  key_name               = var.key_name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "${var.namespace}-wordpress-server"
  }
}
