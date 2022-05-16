#!/bin/bash

res=`cat /etc/hosts | grep -w "$2"`
if [[ $res == "" ]]; then
	echo "$1	$2" >> /etc/hosts
else
	echo "'$res'"
	echo "$2 domain name is already bind"
fi
