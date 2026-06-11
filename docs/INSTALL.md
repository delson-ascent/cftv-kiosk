# INSTALL.md

## Instalação

```bash
git clone https://github.com/delson-ascent/cftv-kiosk.git

cd cftv-kiosk/deploy

chmod +x deploy-base.sh

./deploy-base.sh
```

## Configuração

```bash
cp config.example.json ../web/config.json
```

Editar:

```bash
../web/config.json
```

Configurar:

- Nome das câmeras
- recordingsFolder
- streamUrl
