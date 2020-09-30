ARG BASEIMAGE=alpine:3.11
FROM ${BASEIMAGE}

RUN apk add --no-cache unzip curl

RUN curl -fsS https://install.direct/go.sh | sh

WORKDIR /srv

ENTRYPOINT ["/usr/bin/v2ray"]
