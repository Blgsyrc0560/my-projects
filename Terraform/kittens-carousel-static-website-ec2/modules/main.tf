provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "kittens-ec2" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name = var.keyname
  vpc_security_group_ids = [aws_security_group.kittens-sg.id]
  tags = {
    "Name" = "created-by-tf"
  }
  user_data = data.template_file.kittens.rendered
}

