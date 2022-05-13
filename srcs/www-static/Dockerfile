# use stable version of alpine
FROM alpine:3.15

RUN	apk update && apk upgrade

RUN	apk add nginx --no-cache

# copy config files
COPY	nginx/ /etc/nginx/

# copy static files
COPY	www/* /tmp/www/

COPY	startup.sh /script/startup.sh

ENTRYPOINT ["/bin/sh", "/script/startup.sh"]
#ENTRYPOINT ["nginx", "-g", "daemon off;"]
