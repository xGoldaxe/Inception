#!/bin/bash

echo NextJs docker started

PORT=3000
REPLACE="no"
REPOSITORY=""
MODE="dev"

for var in "$@"
do
	arrModular=(${var//=/ })
	
	if [ "${arrModular[0]}" == "--replace" ] ; then
		
		#do we want to replace the actual content?
		if [ ${arrModular[1]} == "yes" ] ; then
			REPLACE="yes"
		fi

	elif [ "${arrModular[0]}" == "--get" ] ; then
       	
		REPOSITORY=${arrModular[1]}

	elif [ "${arrModular[0]}" == "--mode" ] ; then
       		
		if [ "${arrModular[1]}" == "prod" ] ; then
			MODE="prod"
		fi
	
	elif [ "${arrModular[0]}" == "--port" ] ; then
       		PORT=${arrModular[1]}

	fi
done

if [ ${REPOSITORY} == "" ] ; then
	echo !!! you must provide a valid repo
	echo now exiting...
	exit 1
fi

if [ -d "/home/app" ] && [ ${REPLACE} == "no" ] ; then
	echo "A repository as already been cloned, container will use it!"
else
	echo "====>CLONING REPOSITORY<===="
	rm -rf /home/app
	#let's clone a repository
	apk update && apk add git
	mkdir -p /home/app && cd /home/app
	git clone "${REPOSITORY}" temp
	mv /home/app/temp/* ./
	npm install
fi

if [ "${MODE}" == "dev" ] ; then
	echo "Development mode ====>"
	npx next dev -p ${PORT}
elif [ "${MODE}" == "prod" ] ; then
	echo "Production mode ====>"
	npx next build
	npx next start -p $PORT
fi
