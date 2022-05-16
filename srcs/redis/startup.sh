#!bin/sh

# change some settings in conf file
sed -i "s|bind 127.0.0.1 -::1|bind * -::*|g" /etc/redis.conf
sed -i "s|port 6379|port ${REDIS_PORT}|g" /etc/redis.conf
sed -i "s|maxmemory <bytes>|maxmemory 256mb|g" /etc/redis.conf
sed -i "s|maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g" /etc/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

# make the server run in the foreground
/usr/bin/redis-server /etc/redis.conf
