provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "roman" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.roman_seg_grp.id}"]
  user_data = file("${path.module}/userdata.sh")
  key_name = var.keyname
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
