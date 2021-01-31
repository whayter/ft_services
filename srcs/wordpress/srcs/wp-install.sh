#!/bin/bash

wget -c https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www
chown -R 777 /var/www/wordpress