FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

RUN apk update \
 && apk add --no-cache libc6-compat \
 && wget -q -O - https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz | tar -xz \
 && mv /telegraf-1.17.0/etc/telegraf/ /etc/telegraf/ \
 && cp /telegraf-1.17.0/usr/bin/telegraf /usr/bin/ \
 && rm -rf /telegraf-1.17.0 \
 && telegraf -sample-config telegraf.conf --input-filter cpu:mem --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY ./srcs/telegraf.conf /etc/telegraf

CMD [ "telegraf" ]