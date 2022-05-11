#!/bin/bash

echo "=========>load adminer<========="

mkdir /var/www
cd /var/www
echo "<h1>Test</h1>" > index.html
wget https://www.adminer.org/latest-en.php -O adminer.php

# start php-fpm
php-fpm8 
# start nginx
nginx -g 'daemon off;'
