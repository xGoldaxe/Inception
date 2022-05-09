# use stable version of alpine
FROM alpine:3.15

RUN	apk update && apk upgrade

# inteface for mariadb, openssl for certificate
RUN	apk add nginx openssl --no-cache

# copy config files
COPY	/server/etc/nginx /etc/nginx/

# create TLS key/certificate
RUN	openssl req -newkey rsa:4096 -nodes -sha256 -x509 -days 365 \
-keyout /etc/nginx/pleveque.42.fr.key \
-out /etc/nginx/pleveque.42.fr.crt \
-subj "/C=FR/ST=Paris/L=Paris/O=pleveque/OU=/CN=pleveque.42.fr"

COPY	startup.sh /script/startup.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]
