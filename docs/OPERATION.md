# OPERATION.md

## Estrutura

```text
/opt/cftv
├── web
│   ├── index.html
│   ├── recordings.html
│   ├── server.js
│   └── config.json
```

## Executar interface

```bash
cd /opt/cftv/web

node server.js
```

A interface ficará disponível em:

```text
http://localhost:8080
```

## Verificar API

```bash
curl http://localhost:8080/health
```

```bash
curl http://localhost:8080/api/config
```

```bash
curl http://localhost:8080/api/recordings
```

## Arquivos utilizados

Configuração:

```text
/opt/cftv/web/config.json
```

Vídeos Agent DVR:

```text
/opt/AgentDVR/Media/WebServerRoot/Media/video
```

MediaMTX:

```text
/opt/mediamtx/mediamtx
```
