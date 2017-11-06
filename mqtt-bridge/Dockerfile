FROM resin/rpi-raspbian
ENV ARCH=arm
ENV CROSS_COMPILE=/usr/bin/

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://deb.nodesource.com/node_8.x jessie main' > /etc/apt/sources.list.d/nodesource.list \
 && echo 'deb-src http://deb.nodesource.com/node_8.x jessie main' >> /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends git nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app \
 && cd /usr/src/app \
 && git clone https://github.com/stjohnjohnson/smartthings-mqtt-bridge mqtt-bridge \
 && cd /usr/src/app/mqtt-bridge \
 && npm install
WORKDIR /usr/src/app/mqtt-bridge
CMD [ "CONFIG_DIR=/config", "npm", "start" ]
