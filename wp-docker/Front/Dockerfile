FROM ubuntu:latest
MAINTAINER Alvaro Berrocal

#Actualizamos 
RUN apt-get update 
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install pwgen 


#Añadimos los scipts necesarios para la configuración
ADD ./startFront.sh /startFront.sh

#Instalamos Wordpress
RUN rm -rf /var/www/
ADD https://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar xvzf /wordpress.tar.gz && rm /wordpress.tar.gz
RUN mv /wordpress /var/www/

#Añadimos permisos
RUN chown -R www-data:www-data /var/www/
RUN chmod 755 /startFront.sh

EXPOSE 80
CMD ["/bin/bash", "/startFront.sh"]


