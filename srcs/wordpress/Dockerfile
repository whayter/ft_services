FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache nginx openssl php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
 && yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
 && mkdir -p /run/nginx

COPY ./srcs/wp-install.sh /wp-install.sh

RUN sh /wp-install.sh

COPY ./srcs/wp-config.php /www/var/wordpress/wp-config.php
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/wp-run.sh /wp-run.sh

EXPOSE 5050

ENTRYPOINT ["sh", "/wp-run.sh"]