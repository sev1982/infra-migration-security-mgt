##############################
# Security Group: ALB
##############################

resource "aws_security_group" "alb" {
  name        = "${var.env}-alb-sg"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.env}-alb-sg"
  }
}

# ALB ingress (public)
resource "aws_security_group_rule" "alb_http_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

# ALB egress (allow to instances)
resource "aws_security_group_rule" "alb_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}

##############################
# Security Group: Instances (ASG)
##############################

resource "aws_security_group" "instances" {
  name        = "${var.env}-instances-sg"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.env}-instances-sg"
  }
}

# Allow traffic from ALB only
resource "aws_security_group_rule" "instances_from_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.instances.id
  source_security_group_id = aws_security_group.alb.id
}

# Allow outbound internet (NAT)
resource "aws_security_group_rule" "instances_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.instances.id
}
