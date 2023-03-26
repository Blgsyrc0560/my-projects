#! /bin/bash
sudo yum update -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
newgrp docker
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mkdir -p /home/ec2-user/bookstore
cd /home/ec2-user/bookstore
FOLDER="https://raw.githubusercontent.com/bekirokutan/my-projects/main/Docker/dockerization-bookstore-api-on-python-flask-mysql"
curl -s --create-dirs -o "/home/ec2-user/bookstore/bookstore-api.py" -L "$FOLDER"/bookstore-api.py
curl -s --create-dirs -o "/home/ec2-user/bookstore/Dockerfile" -L "$FOLDER"/Dockerfile
curl -s --create-dirs -o "/home/ec2-user/bookstore/main.tf" -L "$FOLDER"/main.tf
curl -s --create-dirs -o "/home/ec2-user/bookstore/docker-compose.yml" -L "$FOLDER"/docker-compose.yml
curl -s --create-dirs -o "/home/ec2-user/bookstore/requirements.txt" -L "$FOLDER"/requirements.txt
curl -s --create-dirs -o "/home/ec2-user/bookstore/userdata.sh" -L "$FOLDER"/userdata.sh
sudo systemctl start docker
sudo systemctl enable docker
sudo docker-compose up