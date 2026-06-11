#!/bin/bash

set -e
if [ "$EUID" -eq 0 ]; then
  echo "Execute como usuário normal, não como root."
  exit 1
fi

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
  ffmpeg \
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
echo " Instalando MediaMTX"
echo "====================================="

cd /tmp

wget -q https://github.com/bluenviron/mediamtx/releases/latest/download/mediamtx_linux_amd64.tar.gz

tar -xzf mediamtx_linux_amd64.tar.gz

sudo mkdir -p /opt/mediamtx

if [ ! -f mediamtx ]; then
  echo "Erro: binário do MediaMTX não encontrado."
  exit 1
fi
sudo install -m 755 mediamtx /opt/mediamtx/mediamtx

rm -f /tmp/google-chrome.deb
rm -f /tmp/mediamtx_linux_amd64.tar.gz

echo
echo "MediaMTX instalado em:"
echo "/opt/mediamtx/mediamtx"
echo

echo "====================================="
echo " Criando diretórios"
echo "====================================="

sudo mkdir -p \
  /opt/cftv \
  /opt/cftv/logs

sudo chown -R \
  $USER:$USER \
  /opt/cftv

echo
echo "Versões instaladas:"
echo

node -v || true
npm -v || true
google-chrome --version || true
ffmpeg -version | head -n 1 || true

echo

echo "====================================="
echo " Instalação concluída"
echo "====================================="

echo
echo "Próximos passos:"
echo "1. Copiar config.example.json"
echo "2. Configurar as câmeras"
echo "3. Copiar os arquivos web"
echo "4. Configurar o serviço systemd"
echo
