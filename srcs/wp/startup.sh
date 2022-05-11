#!/bin/bash

#wait db to be up
while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME; do
    sleep 1
done
echo connected to db!

#link php8 as php, to make the cli working
ln -s /usr/bin/php8 /usr/bin/php

# if index.php exist, we assume that wordpress already exist
if [ ! -f "/var/www/index.php" ]; then

	#get wp cli
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
		
	echo "Install wordpress:"
	mkdir /var/www/
	cd /var/www/
	wp core download --allow-root
	wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

	wp user create $WP_USR $WP_EMAIL --role=editor --user_pass=$WP_PWD --allow-root
	wp theme install neve --activate --allow-root

fi

# start php-fpm
php-fpm8
