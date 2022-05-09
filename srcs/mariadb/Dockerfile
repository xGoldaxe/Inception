# syntax=docker/dockerfile:1
FROM	alpine:3.15

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY	startup.sh /tmp/startup.sh

ENTRYPOINT ["sh", "/tmp/startup.sh"]
