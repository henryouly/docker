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

RUN apk add --no-cache openssh-client git curl

# install caddy
ARG CAD_URL="https://caddyserver.com/api/download?os=linux&arch=arm&arm=7"
RUN curl -sSL -o /usr/bin/caddy \
      "${CAD_URL}" \
 && chmod 0755 /usr/bin/caddy

EXPOSE 80 443
VOLUME /root/.caddy
WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["run", "--config", "/etc/Caddyfile"]
