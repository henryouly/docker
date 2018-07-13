FROM resin/raspberry-pi2-alpine-node:4-slim
RUN apk add --no-cache openssl

RUN mkdir -p /usr/src/app \
 && cd /usr/src/app \
 && wget -qO- https://github.com/stjohnjohnson/smartthings-mqtt-bridge/archive/v1.4.0.tar.gz | tar xz \
 && cd /usr/src/app/smartthings-mqtt-bridge-1.4.0 \
 && npm install --production

WORKDIR /usr/src/app/smartthings-mqtt-bridge-1.4.0

CMD CONFIG_DIR=/config npm start
