#!/bin/bash
set -e

echo "🔄 Updating system..."
apt update -y

echo "📦 Installing base packages..."
apt install -y ca-certificates curl git docker.io

echo "🐳 Starting Docker..."
systemctl enable docker
systemctl start docker

echo "👤 Adding ubuntu user to docker group..."
usermod -aG docker ubuntu

echo "🐙 Installing Docker Compose (v2)..."
mkdir -p /usr/local/lib/docker/cli-plugins/

curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

echo "✅ Verifying installation..."
docker --version || true
docker compose version || true

echo "🎉 UserData finished successfully"
#The script takes one time to be finished at instance EC2

echo "📥 Clonando projeto..."
cd /home/ubuntu
git clone https://github.com/SEU_USUARIO/SEU_REPO.git

cd SEU_REPO

echo "🔐 Exportando variáveis de ambiente..."
export DB_URL="jdbc:mysql://database-1.cp2uy0osedto.eu-west-1.rds.amazonaws.com:3306/lab_rds"
export DB_USER="admin"
export DB_PASSWORD="vnc(0800)"
export ELASTIC_CACHE_URL="redis-dev-tld3ou.serverless.euw1.cache.amazonaws.com"

echo "🚀 Subindo aplicação com Docker Compose..."
docker compose up --build -d

echo "🎉 Deploy finalizado!"


Depois de entrar na EC2:

nano deploy.sh

Cola o script, salva e executa:

chmod +x deploy.sh
./deploy.sh