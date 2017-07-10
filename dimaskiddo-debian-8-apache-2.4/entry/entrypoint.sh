#!/bin/bash

# Prepare Apache configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/apache2/apache2.conf ]; then
  sudo mkdir -p /var/www/config/apache2
  sudo cp /etc/apache2/apache2.conf.docker /var/www/config/apache2/apache2.conf
fi


# Prepare PHP Apache configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/php5/apache2/php.ini ]; then
  sudo mkdir -p /var/www/config/php5/apache2
  sudo cp /etc/php5/apache2/php.ini.docker /var/www/config/php5/apache2/php.ini
fi


# Prepare Default Web Content file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/html/index.php ]; then
  sudo cp /var/www/docker/index.php /var/www/html/index.php
  sudo cp /var/www/docker/info.php /var/www/html/info.php
fi


# Try to start Apache on non-daemonize mode
sudo /usr/sbin/apache2ctl -D FOREGROUND


# End the script
exit 0