FROM henryouly/rpi-python-base

WORKDIR /root
RUN pip3 install tornado paho-mqtt
RUN curl -O https://raw.githubusercontent.com/henryouly/homeassistant-config/master/example/mqtt-bridge.py && chmod +x mqtt-bridge.py
CMD [ "./mqtt-bridge.py" ]
