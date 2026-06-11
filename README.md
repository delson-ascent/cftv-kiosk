Esse projeto provavelmente ainda não funciona, precisa de algumas correções, mas está muito próximo do funcional
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

## Status

Projeto em desenvolvimento.

Atualmente suporta:

- Agent DVR
- MediaMTX
- 2 câmeras
- Reprodução HLS
- Consulta de gravações

## Arquitetura

```text
LIVE VIEW

RTSP Camera
    ↓
Agent DVR
    ↓
MediaMTX
    ↓
HLS (.m3u8)
    ↓
index.html


RECORDINGS

Agent DVR
    ↓
Arquivos MKV + JPG
    ↓
server.js
    ↓
/api/recordings
    ↓
recordings.html
```

## Estrutura do Projeto

```text
deploy/
├── deploy-base.sh
└── config.example.json

docs/
├── INSTALL.md
└── OPERATION.md

web/
├── index.html
├── recordings.html
├── server.js
└── config.json (gerado a partir do exemplo)

```

## Preparação do Sistema

```bash
git clone https://github.com/delson-ascent/cftv-kiosk.git

cd cftv-kiosk/deploy

chmod +x deploy-base.sh

./deploy-base.sh
```
O script instala as dependências base do sistema (Node.js, Chrome, Agent DVR e utilitários necessários).

## Configuração

Copie o arquivo de exemplo:

```bash
cp deploy/config.example.json web/config.json
```

Edite:

```bash
web/config.json
```

e configure:

- Nome das câmeras
- Pastas do Agent DVR
- URLs HLS
