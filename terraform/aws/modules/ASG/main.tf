resource "aws_launch_template" "app" {
  name_prefix   = "${var.env}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    env = var.env
  }))
  
  vpc_security_group_ids = [var.instances_sg_id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.env}-app"
      Env  = var.env
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.env}-app"
      Environment = var.env
    }
  }
}

resource "aws_autoscaling_group" "app" {
  name                = "${var.env}-asg"
  max_size            = 3
  min_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = var.private_subnets
  health_check_type         = "EC2"
  force_delete              = true
  target_group_arns   = [var.alb_target_group_arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Environment"
    value               = var.env
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-app"
    propagate_at_launch = true
  }
}
