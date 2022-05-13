FROM		alpine:3.15

RUN		apk update && apk upgrade && apk add --no-cache \
		nodejs npm bash

RUN		mkdir -p /home/app/

WORKDIR		/home/app/

EXPOSE 		3050

COPY		startup.sh /script/startup.sh

RUN 		["chmod", "+x", "/script/startup.sh"]

ENTRYPOINT 	[ "/script/startup.sh" ]
