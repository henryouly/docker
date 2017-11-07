FROM henryouly/rpi-python-base

RUN apt-get update \
 && apt-get install -y --no-install-recommends git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /build
WORKDIR /build
RUN git clone https://github.com/LeMaker/RPi.GPIO_BP -b bananapro
WORKDIR /build/RPi.GPIO_BP
RUN python3 setup.py install
WORKDIR /root
RUN pip3 install paho-mqtt rpi-rf
RUN curl -O https://raw.githubusercontent.com/henryouly/homeassistant-config/master/example/mqtt_rf.py && chmod +x mqtt_rf.py
RUN rm -rf /build
CMD [ "./mqtt_rf.py", "-p", "130" ]
