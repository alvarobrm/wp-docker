FROM ubuntu:latest
MAINTAINER Alvaro Berrocal

#Actualizamos 
RUN apt-get update 
RUN apt-get -y upgrade

#Evitamos que pregunte cuando instala e instalamos los paquetes necesarios
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql  php5-ldap

# instalamos supervisor
RUN easy_install supervisor

#Añadimos los scipts necesarios para la configuración
ADD ./startBack.sh /startBack.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./000-default.conf /etc/apache2/sites-available/000-default.conf

#Añadimos permisos
RUN chown -R www-data:www-data /var/www/
RUN chmod 755 /startBack.sh
RUN chmod 755 /etc/apache2/foreground.sh

EXPOSE 80
CMD ["/bin/bash", "/startBack.sh"]
