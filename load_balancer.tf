#############################################
# DATA
############################################

data "aws_elb_service_account" "root" {}

############################################
## RESOURCES
############################################

## aws_lb
resource "aws_lb" "main_lb" {
  name               = "loadb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_nginx1.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.web_bucket.bucket
    prefix  = "alb-logs"
    enabled = true
  }

  tags = local.common_tags
}

## aws_lb_target_group
resource "aws_lb_target_group" "lb_target_group" {
  name     = "loadbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id

  tags = local.common_tags
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


## aws_lb_listener
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.main_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }

  tags = local.common_tags
}


## aws_lb_target_group_attachment
resource "aws_lb_target_group_attachment" "lb_tg_attach1" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.public_ec2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "lb_tg_attach2" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.private_ec2.id
  port             = 80
}