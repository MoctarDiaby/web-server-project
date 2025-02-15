resource "aws_key_pair" "web-server-project_keypair" {
  key_name   = var.key_name
  public_key = tls_private_key.web-server-project_tls.public_key_openssh
}

resource "tls_private_key" "web-server-project_tls" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "web-server-project_local" {
  filename        = var.filename
  content         = tls_private_key.web-server-project_tls.private_key_pem
  file_permission = "0400"
}

