ARG BASEIMAGE=alpine:latest
FROM ${BASEIMAGE}

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL mantainer="Eloy Lopez <elswork@gmail.com>" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="caddy-docker" \
    org.label-schema.description="Docker container for Caddy" \
    org.label-schema.url="https://deft.work" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/DeftWork/caddy-docker" \
    org.label-schema.vendor="Deft Work" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

ARG plugins=tls.dns.duckdns
RUN apk add --no-cache openssh-client git tar curl

# install caddy
ARG CAD_URL="https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_arm7.tar.gz"
RUN curl -sSL -o - \
      "${CAD_URL}" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--agree", "--conf", "/etc/Caddyfile", "--log", "stdout"]
