FROM debian:latest

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install wget sendmail php7.4 php7.4-cli php7.4-common php7.4-fpm php7.4-mysql \
	php7.4-json php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip

RUN sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g" /etc/php/7.4/fpm/pool.d/www.conf

RUN wget -P /tmp/ https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x /tmp/wp-cli.phar

RUN mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress/

RUN wp core download --allow-root --locale=ru_RU --path=/var/www/wordpress/

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/docker-entrypoint.sh" ]
