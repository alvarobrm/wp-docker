
FROM ubuntu:latest
MAINTAINER Alvaro Berrocal

ENV DEBIAN_FRONTEND noninteractive
RUN sudo apt-get update
RUN sudo apt-get -y upgrade

#Requerimientos del sistema
RUN apt-get -y install mysql-server mysql-client nginx php5-fpm php5-mysql php-apc pwgen python-setuptools curl git unzip

#Requerimientos de Wordpress
RUN apt-get -y install php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl


#Configurar mysql
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf


# Instalar Wordpress
ADD https://wordpress.org/latest.tar.gz /home/latest.tar.gz
RUN cd /home && tar xvf latest.tar.gz 

# Inicializacion de Wordpress
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

#expose
EXPOSE 3306
EXPOSE 80

# volume para mysql y wordpress
VOLUME ["/var/lib/mysql"]

CMD ["/bin/bash", "/start.sh"]
