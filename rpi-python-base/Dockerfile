FROM resin/rpi-raspbian
# Base layer
ENV ARCH=arm
ENV CROSS_COMPILE=/usr/bin/
RUN apt-get update && \
    apt-get install --no-install-recommends \
      build-essential python3-dev python3-pip python3-setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

CMD [ "bash" ]
