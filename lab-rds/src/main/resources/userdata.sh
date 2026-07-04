#!/bin/bash

set -e

echo "🔄 Atualizando sistema..."
sudo apt update -y && sudo apt upgrade -y

echo "📦 Instalando dependências básicas..."
sudo apt install -y git curl

echo "🐳 Instalando Docker..."
sudo apt install -y docker.io

sudo systemctl enable docker
sudo systemctl start docker

echo "👤 Configurando usuário docker..."
sudo usermod -aG docker ubuntu

echo "🐙 Instalando Docker Compose (plugin oficial)..."
sudo mkdir -p /usr/local/lib/docker/cli-plugins/

sudo curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

echo "✅ Verificando versões..."
docker --version
docker compose version

echo "📥 Clonando projeto..."
cd /home/ubuntu
git clone https://github.com/SEU_USUARIO/SEU_REPO.git

cd SEU_REPO

echo "🔐 Exportando variáveis de ambiente..."
export DB_URL="jdbc:mysql://database-1.cp2uy0osedto.eu-west-1.rds.amazonaws.com:3306/lab-rds"
export DB_USER="admin"
export DB_PASSWORD="vnc(0800)"

echo "🚀 Subindo aplicação com Docker Compose..."
docker compose up --build -d

echo "🎉 Deploy finalizado!"


Depois de entrar na EC2:

nano deploy.sh

Cola o script, salva e executa:

chmod +x deploy.sh
./deploy.sh