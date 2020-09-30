#!/bin/bash

echo 200M > /sys/block/zram2/disksize
mkfs.ext4 /dev/zram2
mount /dev/zram2 /var/lib/influxdb
