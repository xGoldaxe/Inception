# use stable version of alpine
FROM alpine:3.15


RUN	apk update && apk upgrade && apk add --no-cache redis

COPY	startup.sh /script/startup.sh

ENTRYPOINT ["/bin/sh", "/script/startup.sh"]
