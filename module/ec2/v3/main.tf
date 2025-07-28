resource "aws_instance" "EC2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  disable_api_termination = false
  iam_instance_profile    = var.iam_instance_profile_name

  user_data = var.user_data

  tags = {
    Name         = "${var.company_name}-${var.name}"
    company_name = var.company_name
    project_name = var.project_name
    env          = var.env
  }
}

resource "aws_security_group" "ssh" {
  name        = "${var.name}-ssh"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
