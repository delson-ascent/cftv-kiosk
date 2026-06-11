const express = require("express");
const fs = require("fs");
const path = require("path");

const app = express();

const PORT = 8080;

/*
 * Configuração das câmeras
 * Ajustar conforme necessário
 */
const config =
  JSON.parse(
    fs.readFileSync(
      path.join(__dirname, "config.json"),
      "utf8"
    )
  );
if (!config.cameras) {

  throw new Error(
    "config.json inválido: cameras não encontrado"
  );

}

/*
 * Pasta do Agent DVR
 */
const VIDEO_ROOT =
  "/opt/AgentDVR/Media/WebServerRoot/Media/video";

/*
 * Interface Web
 */
app.use(express.static(__dirname));

/*
 * Vídeos e thumbs
 */
app.use(
  "/videos",
  express.static(VIDEO_ROOT)
);

/*
 * Lista gravações
 */
app.get("/api/recordings", (req, res) => {

  const result = {};

  config.cameras.forEach(camera => {

      const cameraName =
        camera.name;

      const folder =
        camera.folder;

      const cameraPath =
        path.join(VIDEO_ROOT, folder);

      result[cameraName] = {};

      if (!fs.existsSync(cameraPath)) {
        return;
      }

      const files = fs.readdirSync(cameraPath);

      files
        .filter(file =>
          file.toLowerCase().endsWith(".mkv")
        )
        .sort()
        .reverse()
        .slice(0, 500)
        .forEach(file => {

          /*
           * Exemplo:
           * 2_2026-05-14_10-35-18_827.mkv
           */

          const match =
            file.match(
              /^\d+_(\d{4}-\d{2}-\d{2})_(\d{2}-\d{2}-\d{2})/
            );

          if (!match) {
            return;
          }

          const date =
            match[1];

          const time =
            match[2].replaceAll("-", ":");

          if (!result[cameraName][date]) {
            result[cameraName][date] = [];
          }

          result[cameraName][date].push({

            file,

            path:
              `/videos/${folder}/${file}`,

            thumb:
              `/videos/${folder}/thumbs/${file.replace(
                ".mkv",
                ".jpg"
              )}`,

            time

          });

        });

    }
  );

  res.json(result);

});

app.get("/api/config", (req, res) => {
  res.json(config);
});

app.listen(PORT, () => {

  console.log(
    `CFTV Web Server rodando na porta ${PORT}`
  );

});
