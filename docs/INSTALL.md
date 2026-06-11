# Instalação

## Requisitos

Sistema operacional:

- Ubuntu 24.04 LTS
- Acesso sudo
- Conexão com internet

Hardware recomendado:

- CPU x86_64
- 4 GB RAM
- SSD

---

## Clonar repositório

```bash
git clone https://github.com/delson-ascent/cftv-kiosk.git

cd cftv-kiosk
```

---

## Executar instalação base

```bash
cd deploy

chmod +x deploy-base.sh

./deploy-base.sh
```

O script instala:

- Node.js
- npm
- FFmpeg
- Google Chrome
- Agent DVR
- MediaMTX

---

## Configurar câmeras

Copie o arquivo de exemplo:

```bash
cp deploy/config.example.json web/config.json
```

Edite:

```bash
nano web/config.json
```

Exemplo:

```json
{
  "cameras": [
    {
      "name": "Portão",
      "recordingsFolder": "ABCDE",
      "streamUrl": "http://localhost:8888/camera1/index.m3u8"
    },
    {
      "name": "Pátio",
      "recordingsFolder": "FGHIJ",
      "streamUrl": "http://localhost:8888/camera2/index.m3u8"
    }
  ]
}
```

---

## Iniciar servidor web

Entre na pasta:

```bash
cd web
```

Instale dependências:

```bash
npm install express
```

Execute:

```bash
node server.js
```

Servidor disponível em:

```text
http://localhost:8080
```

---

## Verificação

Teste os endpoints:

```text
http://localhost:8080/health
```

Retorno esperado:

```json
{
  "status": "ok"
}
```

Teste:

```text
http://localhost:8080/api/config
```

Teste:

```text
http://localhost:8080/api/recordings
```

---

## Próximos Passos

Após validar o funcionamento:

- Configurar serviço systemd
- Configurar inicialização automática
- Configurar Chrome em modo kiosk
- Configurar MediaMTX
