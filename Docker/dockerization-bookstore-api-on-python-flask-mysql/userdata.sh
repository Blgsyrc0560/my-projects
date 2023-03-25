#! /bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
newgrp docker
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
FOLDER="https://raw.githubusercontent.com/bekirokutan/my-projects/main/Docker/dockerization-bookstore-api-on-python-flask-mysql"
curl -s --create-dirs -o "/home/ec2-user/bookstore-api.py" -L "$FOLDER"/bookstore-api.py
curl -s --create-dirs -o "/home/ec2-user/Dockerfile" -L "$FOLDER"/Dockerfile
curl -s --create-dirs -o "/home/ec2-user/main.tf" -L "$FOLDER"/main.tf
curl -s --create-dirs -o "/home/ec2-user/docker-compose.yml" -L "$FOLDER"/docker-compose.yml
curl -s --create-dirs -o "/home/ec2-user/requirements.txt" -L "$FOLDER"/requirements.txt
curl -s --create-dirs -o "/home/ec2-user/userdata.sh" -L "$FOLDER"/userdata.sh
docker-compose up