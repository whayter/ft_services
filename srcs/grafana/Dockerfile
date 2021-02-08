FROM alpine
LABEL Maintener: Winston Hayter - hwinston@student.42.fr

ENV PATH="${PATH}:grafana/bin"

RUN apk update \
 && apk add --no-cache libc6-compat \
 && wget -q -O - https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz | tar -xz \
 && mv /grafana-7.3.6 /grafana \
 && mkdir -p /var/lib/grafana_dashboards/

COPY srcs/datasources.yaml /grafana/conf/provisioning/datasources/influxdb.yaml
COPY srcs/dashboards.yaml /grafana/conf/provisioning/dashboards/influxdb.yaml
COPY srcs/dashboard.json /var/lib/grafana_dashboards/

EXPOSE 3000

CMD [ "grafana-server", "-homepath=/grafana" ]