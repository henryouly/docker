FROM resin/raspberry-pi2-alpine-node:0.10-slim

ADD pixelserv.js /root
ADD server.pem /root
EXPOSE 8080 4443
WORKDIR "/root"
CMD [ "node", "./pixelserv.js" ]
