#!/bin/bash

set -e

echo "====================================="
echo " Atualizando sistema"
echo "====================================="

sudo apt update
sudo apt upgrade -y

echo "====================================="
echo " Instalando dependências"
echo "====================================="

sudo apt install -y \
  curl \
  wget \
  git \
  unzip \
  nodejs \
  npm

echo "====================================="
echo " Instalando Google Chrome"
echo "====================================="

wget -O /tmp/google-chrome.deb \
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install -y /tmp/google-chrome.deb

echo "====================================="
echo " Instalando Agent DVR"
echo "====================================="

bash <(
  curl -s \
  https://raw.githubusercontent.com/ispysoftware/agent-install-scripts/main/v2/install.sh
)

echo "====================================="
echo " Criando diretórios"
echo "====================================="

sudo mkdir -p /opt/cftv

sudo chown -R \
  $USER:$USER \
  /opt/cftv

echo "====================================="
echo " Instalação concluída"
echo "====================================="
