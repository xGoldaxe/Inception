# use stable version of alpine
FROM alpine:3.15

RUN	apk update && apk upgrade && apk add vsftpd --no-cache

COPY	vsftpd.conf /tmp/vsftpd.conf

COPY	startup.sh /script/startup.sh

ENTRYPOINT ["/bin/sh", "/script/startup.sh"]
