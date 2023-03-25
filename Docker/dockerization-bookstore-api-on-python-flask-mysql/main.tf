provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "bookstore" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name = var.keyname
  vpc_security_group_ids = [aws_security_group.bookstore-sg.id]
  tags = {
    "Name" = "Web Server of Bookstore"
  }
  user_data = data.template_file.bookstore.rendered
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

data "template_file" "bookstore" {
  template = "${file("${path.module}/userdata.sh")}"
  vars = {
    user-data-git-adres = var.git-adres
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

variable "git-adres" {}
variable "keyname" {}