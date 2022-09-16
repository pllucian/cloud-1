#!/bin/sh

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/selfsigned.key -out /etc/ssl/certs/selfsigned.crt \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21 School/OU=$USER_NAME/CN=$DOMAIN_NAME/emailAddress=$EMAIL_ADDRESS"

exec nginx -g 'daemon off;'
