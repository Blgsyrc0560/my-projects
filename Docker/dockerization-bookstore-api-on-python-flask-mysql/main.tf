terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "github" {
 token = "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"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "bookstore" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name = "first-key"
  vpc_security_group_ids = [aws_security_group.bookstore-sg.id]
  tags = {
    "Name" = "Web Server of Bookstore"
  }
  user_data = file("${path.module}/userdata.sh")
}

output "public_dns" {
    value = aws_instance.bookstore.public_dns
}



resource "aws_security_group" "bookstore-sg" {
  name = "bookstore-sec-grp"
  description = "Allow HTTP and SSH traffic via Terraform"

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


data "aws_ami" "amazon-linux-2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
}


variable "files" {
  default = ["bookstore-api.py", "requirements.txt", "Dockerfile", "docker-compose.yml"]
}

resource "github_repository_file" "app-files" {
  for_each = toset(var.files)
  content = file(each.value)
  file ="Docker/dockerization-bookstore-api-on-python-flask-mysql/${each.value}"
  repository = "my-projects"
  branch = "main"
  commit_message = "managed by terraform"
  overwrite_on_create = true
}