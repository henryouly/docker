docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 67:67/udp \
    -p 10080:80 \
    -e TZ="America/Los_Angeles" \
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=8.8.8.8 \
    --restart=unless-stopped \
    pihole/pihole:4.2.2-1
