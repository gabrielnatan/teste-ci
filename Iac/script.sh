#!/bin/bash

echo "Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

echo "Instalando dependências..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "Adicionando chave GPG do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adicionando repositório do Docker..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Atualizando pacotes com repositório do Docker..."
sudo apt update -y

echo "Instalando o Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "Iniciando o Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Adicionando o usuário atual ao grupo Docker..."
sudo usermod -aG docker $USER

echo "Verificando a instalação do Docker..."
docker --version && echo "Docker instalado com sucesso!"
