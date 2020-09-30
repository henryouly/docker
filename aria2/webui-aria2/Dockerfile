ARG BASEIMAGE=alpine:3.11
FROM ${BASEIMAGE}

RUN apk add --update --no-cache git darkhttpd && \
    git clone https://github.com/ziahamza/webui-aria2 /opt/webui-aria2 && \
    apk del git && \
    rm -rf /var/cache/apk/*
EXPOSE 80

ENTRYPOINT ["/usr/bin/darkhttpd"]
CMD ["/opt/webui-aria2/docs", "--chroot", "--uid", "darkhttpd", "--gid", "www-data", "--log", "/dev/stdout"]]
