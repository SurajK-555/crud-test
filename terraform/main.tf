# SIMPLE TERRAFORM - Just EC2 Instance
# This creates ONE virtual server on AWS where your app runs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Connect to AWS
provider "aws" {
  region = var.aws_region
}

# ============================================
# 1. SECURITY GROUP (Firewall Rules)
# ============================================
resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH, HTTP, and App traffic"

  # Allow SSH (port 22) for login
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow FastAPI (port 8000)
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# ============================================
# 2. EC2 INSTANCE (Virtual Server)
# ============================================
resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 (us-east-1)
  instance_type = "t3.micro"               # Free tier eligible

  # Use security group we created
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # Installation script - runs when server starts
  user_data = base64encode(file("${path.module}/install.sh"))

  tags = {
    Name = "${var.project_name}-server"
  }
}

# ============================================
# 3. ELASTIC IP (Static IP Address)
# ============================================
resource "aws_eip" "app_eip" {
  instance = aws_instance.app_server.id
  domain   = "vpc"

  tags = {
    Name = "${var.project_name}-eip"
  }

  depends_on = [aws_instance.app_server]
}
