FROM debian:latest

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install wget pwgen php7.4 php7.4-cli php7.4-common php7.4-fpm php7.4-mysql

RUN sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9001/g" /etc/php/7.4/fpm/pool.d/www.conf

RUN wget -P /tmp/ https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

RUN mkdir -p /var/www/phpmyadmin/

RUN tar -xf /tmp/phpMyAdmin-latest-all-languages.tar.gz -C /var/www/phpmyadmin/ --strip-components=1

RUN rm /tmp/phpMyAdmin-latest-all-languages.tar.gz

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 9001

ENTRYPOINT [ "/docker-entrypoint.sh" ]
