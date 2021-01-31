#!/bin/sh

wget -q -O - https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz | tar -xz -C /var/www
mv /var/www/phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin