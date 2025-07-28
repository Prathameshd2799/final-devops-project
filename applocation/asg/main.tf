resource "aws_security_group" "web_sg" {
  name        = "fqts-asg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

module "alb" {
  source            = "../../module/ALB-ASG"
  vpc_id            = var.vpc_id
  subnets           = var.subnets
  security_group_id = aws_security_group.web_sg.id
}

module "asg" {
  source            = "../../module/asg"
  subnets           = var.subnets
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  desired_capacity  = 1
  max_size          = 2
  min_size          = 1
  target_group_arn  = module.alb.target_group_arn
  security_group_id = aws_security_group.web_sg.id
  asg_name          = var.asg-name
  user_data = "setup.sh"
}
