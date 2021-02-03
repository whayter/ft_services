FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache mysql mysql-client 
 #&& addgroup mysql mysql \
 #&& mkdir -p /var/lib/mysql \
 #&& chown -R mysql:mysql /var/lib/mysql \
 #&& chmod 1777 /var/lib/mysql

#COPY ./srcs/my.cnf /etc/my.cnf
#COPY ./srcs/entrypoint.sh /entrypoint.sh
#COPY ./srcs/init_db.sh /init_db.sh
#COPY ./srcs/init.sh /init.sh
#COPY ./srcs/db.sql /db.sql
#COPY ./srcs/wordpress.sql /wordpress.sql

COPY ./srcs/ .

VOLUME /var/lib/mysql

EXPOSE 3306

CMD [ "sh", "./entrypoint.sh" ]