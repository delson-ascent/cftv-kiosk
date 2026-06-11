# CFTV Kiosk

Sistema de monitoramento baseado em:

- Agent DVR
- MediaMTX
- Node.js
- HTML/CSS/JavaScript

## Funcionalidades

- Visualização ao vivo
- Visualização em split
- Consulta de gravações
- Reprodução de vídeos
- Kiosk Mode
- Compatível com Chrome

## Arquitetura

Agent DVR
    ↓
Arquivos MKV + JPG
    ↓
Node.js (server.js)
    ↓
API /api/recordings
    ↓
recordings.html

MediaMTX
    ↓
HLS (.m3u8)
    ↓
index.html

## Instalação

```bash
git clone https://github.com/delson-ascent/cftv-kiosk.git

cd cftv-kiosk/deploy

chmod +x deploy-base.sh

./deploy-base.sh

cp deploy/config.example.json web/config.json
