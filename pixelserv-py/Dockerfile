FROM henryouly/rpi-python-base

ADD pixelserv.py /root
ADD server.pem /root
EXPOSE 80 443
WORKDIR "/root"
CMD [ "./pixelserv.py" ]
