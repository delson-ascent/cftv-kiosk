git clone https://github.com/delson-ascent/cftv-kiosk.git

cd cftv-kiosk

cp deploy/config.example.json web/config.json

nano web/config.json

# quando existir package.json
npm install

sudo systemctl enable cftv-web
sudo systemctl start cftv-web
