FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add influxdb

VOLUME /var/lib/influxdb

COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086 8088

CMD [ "influxd" ]