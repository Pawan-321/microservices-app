# Security Group for K8s Master
resource "aws_security_group" "k8s_master" {
  name        = "${var.environment}-k8s-master-sg"
  description = "Security group for Kubernetes master node"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
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
    Name        = "${var.environment}-k8s-master-sg"
    Environment = var.environment
  }
}

# EC2 Instance for K8s Master
resource "aws_instance" "k8s_master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_ids[0]

  vpc_security_group_ids = [aws_security_group.k8s_master.id]

  user_data = file("${path.module}/scripts/install-k8s.sh")

  tags = {
    Name        = "${var.environment}-k8s-master"
    Environment = var.environment
    Role        = "master"
  }

  root_block_device {
    volume_size = 30  # Free tier: up to 30GB
    volume_type = "gp2"
  }
}

# Data source for Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.environment}-k8s-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.k8s_master.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name        = "${var.environment}-k8s-alb"
    Environment = var.environment
  }
}

# Target Group
resource "aws_lb_target_group" "frontend" {
  name     = "${var.environment}-frontend-tg"
  port     = 30080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
  }
}

# Listener
resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "master" {
  target_group_arn = aws_lb_target_group.frontend.arn
  target_id        = aws_instance.k8s_master.id
  port             = 30080
}
