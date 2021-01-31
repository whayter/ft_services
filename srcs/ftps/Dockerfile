FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache vsftpd openssl \
 && yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-key.pem -out /etc/ssl/private/vsftpd-cert.pem

COPY ./srcs/vsftpd.conf /etc/vsftpd.conf
COPY ./srcs/create-usr.sh /usr/local/bin
RUN chmod +x /usr/local/bin/create-usr.sh

EXPOSE 21 20 21020 21021 21022

ENTRYPOINT [ "create-usr.sh" ]

CMD [ "vsftpd" ]