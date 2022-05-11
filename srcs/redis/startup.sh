#!/bin/sh

sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf
#sed -i "s|bind 127.0.0.1 -::1|#bind 127.0.0.1 -::1|g" /etc/redis.conf
#sed -i "s|# requirepass foobared|requirepass ${REDIS_PASS}|g" /etc/redis.conf
#sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis.conf
#sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis.conf

redis-server --protected-mode no
