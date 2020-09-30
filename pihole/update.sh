curl -sSL -o youtube.txt https://api.hackertarget.com/hostsearch/?q=googlevideo.com
grep -vE "redirector|manifest|^googlevideo" youtube.txt \
  | cut -d, -f1 \
  | sed -re 's/(^r[[:digit:]]+)(\.)(sn)/\1---\3/' \
  > etc-pihole/youtube.list
APPID="2V3A5K-LPJVHQALKA"
curl -sSL -o youtube2.txt "http://api.wolframalpha.com/v2/query?input=googlevideo.com&appid=${APPID}&format=plaintext&podtimeout=20&podstate=WebSiteStatisticsPod:InternetData__Subdomains&podstate=WebSiteStatisticsPod:InternetData__Subdomains_More"
grep -Po "r\d+---sn-.+.googlevideo.com" youtube2.txt > etc-pihole/youtube2.list
docker exec -it pihole pihole updateGravity
