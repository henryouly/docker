FROM resin/raspberry-pi2-alpine-python:3-slim

ADD pixelserv.py /root
ADD server.pem /root
EXPOSE 80 443
WORKDIR "/root"
CMD [ "./pixelserv.py" ]
