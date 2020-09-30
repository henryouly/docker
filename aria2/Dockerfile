ARG BASEIMAGE=alpine:3.11
FROM ${BASEIMAGE}

RUN apk add --update --no-cache aria2 && rm -rf /var/cache/apk/*
RUN touch /root/aria2.session
EXPOSE 6800
VOLUME /data
WORKDIR /srv

ENTRYPOINT ["/usr/bin/aria2c"]
CMD ["--conf", "/root/aria2.conf", "--log", "-"]
