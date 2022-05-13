#!/bin/sh

mv -rf /tmp/www/*  /var/www
echo "===>Run www-static<==="
nginx -g 'daemon off;'
