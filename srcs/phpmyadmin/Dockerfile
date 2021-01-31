FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache nginx openssl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
 && yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
 && mkdir -p /run/nginx

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/install.sh /usr/local/bin
COPY ./srcs/start.sh /usr/local/bin

RUN chmod +x /usr/local/bin/install.sh \
 && sh /usr/local/bin/install.sh \
 && chmod +x /usr/local/bin/start.sh

COPY ./srcs/config.inc.php /var/www/phpmyadmin/config.inc.php

VOLUME [ "/var/lib/mysql" ]

EXPOSE 5000

ENTRYPOINT [ "start.sh" ]