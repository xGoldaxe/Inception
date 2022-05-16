#!/bin/bash

#wait db to be up
while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME; do
    sleep 1
done
echo connected to db!

#wait redis server to be up
until redis-cli -h "${REDIS_HOST}" -p ${REDIS_PORT} -e 'quit'; do
  echo >&2 "redis is unavailable - sleeping"
  sleep 1
done

#link php8 as php, to make the cli working
ln -s /usr/bin/php8 /usr/bin/php

# if index.php exist, we assume that wordpress already exist
if [ ! -f "/var/www/index.php" ]; then

		
	echo "Install wordpress:"
	#get wp cli
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	
	#dl wordpress
	mkdir /var/www/
	cd /var/www/
	wp core download --allow-root
	wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	# add another user
	wp user create $WP_USR $WP_EMAIL --role=editor --user_pass=$WP_PWD --allow-root
	
	# setup options
	sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
    	sed -i "41i define( 'WP_REDIS_PORT', $REDIS_PORT );"               wp-config.php

	# install redis dependencies
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
fi

# start php-fpm
php-fpm8
