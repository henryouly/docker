FROM resin/raspberry-pi2-alpine-python:3-slim

ADD requirements.txt /tmp
ADD mqtt-bridge.py /root
WORKDIR /root
RUN pip3 install -r /tmp/requirements.txt
CMD [ "./mqtt-bridge.py" ]
