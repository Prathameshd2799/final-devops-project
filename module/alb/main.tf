resource "aws_security_group" "alb_sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_lb" "app_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "app_tg1" {
  name     = var.target_group1_name
  port     = var.target_group1_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "app_tg2" {
  name     = var.target_group2_name
  port     = var.target_group2_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "attach1" {
  count            = length(var.instance_ids1)
  target_group_arn = aws_lb_target_group.app_tg1.arn
  target_id        = var.instance_ids1[count.index]
  port             = var.target_group1_port
}

resource "aws_lb_target_group_attachment" "attach2" {
  count            = length(var.instance_ids2)
  target_group_arn = aws_lb_target_group.app_tg2.arn
  target_id        = var.instance_ids2[count.index]
  port             = var.target_group2_port
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.app_tg1.arn
        weight = 1
      }

      target_group {
        arn    = aws_lb_target_group.app_tg2.arn
        weight = 1
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}
