#!/bin/bash

docker compose down
docker image rm -f pleveque/wordpress:stable
docker image rm -f pleveque/mariadb:stable
docker image rm -f pleveque/nginx:stable
docker image rm -f pleveque/adminer:stable
docker image rm -f pleveque/redis:stable
#docker image rm -f pleveque/ftp:stable
docker image rm -f pleveque/www-static:stable
docker image rm -f pleveque/nextjs:stable
docker compose up
