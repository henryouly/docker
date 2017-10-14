FROM bananapi-home-assistant:0.55.0

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://deb.nodesource.com/node_8.x jessie main' > /etc/apt/sources.list.d/nodesource.list \
 && echo 'deb-src http://deb.nodesource.com/node_8.x jessie main' >> /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN git clone https://github.com/stjohnjohnson/smartthings-mqtt-bridge mqtt-bridge
WORKDIR /usr/src/app/mqtt-bridge
RUN npm install
CMD CONFIG_DIR=/config npm start
