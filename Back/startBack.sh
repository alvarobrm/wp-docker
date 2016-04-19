#!/bin/bash

/usr/bin/mysqld_safe & 
sleep 10s #esperamos 10s para dar tiempo a que se arranque
WORDPRESS_DB="wordpress"
MYSQL_PASSWORD="Cambiame1234"
WORDPRESS_PASSWORD="Cambiame1234"

mv /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.orig
sed "s/upload_max_filesize = 2M/upload_max_filesize = 20M/" /etc/php5/apache2/php.ini.orig > /etc/php5/apache2/php.ini

mysqladmin -u root password $MYSQL_PASSWORD 
mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"
killall mysqld
sleep 10s #esperamos otros 10s para dar tiempo a que se pare
supervisord -n
