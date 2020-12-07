FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

# apk
RUN apk update
RUN apk upgrade

# nginx
RUN apk add nginx

# bash
RUN apk add bash

#ssh
RUN apk add openssh 

# ssl
RUN apk add openssl
RUN adduser -D user
RUN echo "user:password" | chpasswd
RUN ssh-keygen -A
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN mkdir -p /run/nginx
COPY ./srcs/* srcs_docker/
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY /srcs/setup.sh /setup.sh
COPY ./srcs/index.html /usr/share/nginx/html/index.html
COPY ./srcs/style.css /usr/share/nginx/html/style.css

EXPOSE 80 443

ENTRYPOINT ["sh", "/setup.sh"]