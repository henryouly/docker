docker stop pixelserv
docker rm pixelserv
docker run -d \
  --name pixelserv \
  --restart unless-stopped \
  -p 4443:443 \
  henryouly/pixelserv
