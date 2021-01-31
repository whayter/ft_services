FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache nginx openssl \
 && yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
 && mkdir -p /run/nginx
 
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /usr/share/nginx/html/index.html
COPY ./srcs/style.css /usr/share/nginx/html/style.css

EXPOSE 80 443

CMD [ "nginx", "-g", "daemon off;" ]