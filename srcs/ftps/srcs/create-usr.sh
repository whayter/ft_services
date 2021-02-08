#!/bin/sh

adduser -D --shell /bin/ash "admin" "admin"
echo "admin:admin" | chpasswd
mkdir -p /ftps_data/
chmod 770 -R /ftps_data
chown -R admin /ftps_data
chgrp -R admin /ftps_data

"$@"