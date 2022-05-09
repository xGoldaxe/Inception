#!/bin/bash

docker compose down
docker image rm -f pleveque/wordpress
docker image rm -f pleveque/mariadb
docker image rm -f pleveque/nginx
docker compose up
