docker stop pixelserv
docker rm pixelserv
docker run -d \
  --name pixelserv \
  --restart unless-stopped \
  -p 8080:8080 \
  -p 4443:4443 \
  henryouly/pixelserv-node
