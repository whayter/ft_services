FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache mysql mysql-client 

COPY ./srcs/ .

VOLUME /var/lib/mysql

EXPOSE 3306

CMD [ "sh", "./entrypoint.sh" ]