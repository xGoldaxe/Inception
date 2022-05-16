#!/bin/sh

mv -f /tmp/www/*  /var/www
echo "===>Run www-static<==="
nginx -g 'daemon off;'
