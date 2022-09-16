FROM debian:latest

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install nginx openssl

COPY ./default /etc/nginx/sites-available/default

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 80 443

ENTRYPOINT [ "/docker-entrypoint.sh" ]
