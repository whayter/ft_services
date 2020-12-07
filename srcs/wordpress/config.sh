#!/bin/bash

# set variables
ROOT=/var/www
WP=https://wordpress.org/latest.tar.gz

# install wordpress
wget -c $WP -O - | tar -xz -C $ROOT
chown -R www-data: $ROOT/wordpress