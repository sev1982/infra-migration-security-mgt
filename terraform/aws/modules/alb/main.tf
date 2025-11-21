/*resource "aws_lb" "app" {
  name               = "${var.app_name}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnets
}

# ----------------------------
# Load Balancer Security Group
# ----------------------------
resource "aws_security_group" "lb_sg" {
  name        = "lb-sg"
  description = "Allow HTTP from anywhere to LB"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP"
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

  tags = {
    Name = "lb-sg"
  }
}
*/

resource "aws_lb" "application" {
  name               = "${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnets

  tags = {
    Name = "${var.env}-alb"
    Env  = var.env
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = "${var.env}-tg"
  port     = var.tg_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = var.target_type

  health_check {
    path = var.health_check_path
  }

  tags = {
    Name = "${var.env}-tg"
    Env  = var.env
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.application.arn
  port              = var.port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
