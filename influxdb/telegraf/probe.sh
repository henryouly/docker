echo -n "cpuminer,host=$2 "
echo summary | \
  /opt/telegraf/nc $1 4048 | \
  sed -e 's/;/,/g;s/=/="/g;s/,/",/g;s/$/"/;s/|//' 
