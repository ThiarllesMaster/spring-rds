#Script developed to used at UserData during the EC2 starting
#!/bin/bash
apt-get update -y

apt-get install -y git

apt-get install -y docker.io

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

apt-get install -y docker-compose-plugin