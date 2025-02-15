key_name            = "datascientest"
security_group_name = "datascientest_sg"
sg_ports            = [9000, 22, 8080, 8069, 80, 30080, 30069, 30081, 6443]
instance_type       = "t2.medium"
username            = "ubuntu"
region              = "us-east-1"
script_name         = "docker.sh"