FROM debian:latest

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install default-mysql-server

RUN sed -i "s/# port/port/g" /etc/mysql/my.cnf

RUN sed -i "s/socket/# socket/g" /etc/mysql/my.cnf

RUN sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "/docker-entrypoint.sh" ]
