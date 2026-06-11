# OPERATION.md

# Operação do Sistema

## Serviços Utilizados

O sistema é composto pelos seguintes componentes:

* Agent DVR
* MediaMTX
* Node.js (server.js)
* Google Chrome (Kiosk Mode)

---

# Inicialização

## Iniciar Agent DVR

Verificar status:

```bash
sudo systemctl status AgentDVR
```

Iniciar:

```bash
sudo systemctl start AgentDVR
```

Parar:

```bash
sudo systemctl stop AgentDVR
```

---

## Iniciar MediaMTX

Exemplo:

```bash
/opt/mediamtx/mediamtx
```

Verificar se a porta HLS está disponível:

```bash
curl http://localhost:8888
```

---

## Iniciar Interface Web

Entrar na pasta do projeto:

```bash
cd /opt/cftv/web
```

Executar:

```bash
node server.js
```

A interface ficará disponível em:

```text
http://localhost:8080
```

---

# Verificações

## Health Check

```bash
curl http://localhost:8080/health
```

Resposta esperada:

```json
{
  "status": "ok"
}
```

---

## Configuração

Verificar configuração carregada:

```bash
curl http://localhost:8080/api/config
```

---

## Lista de Gravações

Verificar API:

```bash
curl http://localhost:8080/api/recordings
```

---

# Estrutura de Arquivos

## Interface

```text
/opt/cftv/web
```

## Configuração

```text
/opt/cftv/web/config.json
```

## Vídeos Agent DVR

```text
/opt/AgentDVR/Media/WebServerRoot/Media/video
```

## MediaMTX

```text
/opt/mediamtx/mediamtx
```

---

# Atualização

Atualizar código:

```bash
git pull
```

Reiniciar interface:

```bash
node server.js
```

---

# Problemas Comuns

## Não aparecem câmeras

Verificar:

* URLs HLS no config.json
* MediaMTX em execução
* Agent DVR gravando corretamente

---

## Não aparecem gravações

Verificar:

* recordingsFolder configurado corretamente
* Arquivos MKV presentes
* Permissões de leitura

---

## Erro ao abrir vídeos

Verificar:

* Arquivos MKV existentes
* Pasta thumbs criada pelo Agent DVR
* Permissões da pasta Media/video

---

# Logs

Servidor Web:

```bash
node server.js
```

Agent DVR:

```bash
sudo journalctl -u AgentDVR -f
```

MediaMTX:

```bash
/opt/mediamtx/mediamtx
```
