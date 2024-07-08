variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

resource "aws_launch_configuration" "nginx_lc" {
  name_prefix               = "nginx-lc-"
  image_id                  = "ami-04a81a99f5ec58529" 
  instance_type             = "t2.micro"
  security_groups           = [aws_security_group.nginx.id]
  associate_public_ip_address = false
  iam_instance_profile      = aws_iam_instance_profile.nginx_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "nginx_asg" {
  desired_capacity     = 2
  min_size             = 2
  max_size             = 4
  launch_configuration = aws_launch_configuration.nginx_lc.id
  vpc_zone_identifier  = var.private_subnets

  tag {
    key                 = "Name"
    value               = "Mynginx-server"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "nginx" {
  name        = "Mynginx-sg"
  description = "Security group for NGINX servers"

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

resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx-profile"

  roles = [aws_iam_role.nginx_role.name]
}

resource "aws_iam_role" "nginx_role" {
  name = "nginx-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}
