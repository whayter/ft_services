#!/bin/sh

adduser -D --shell /bin/ash "user" "user"
echo "user:password" | chpasswd
mkdir -p /ftps_data/
chmod 770 -R /ftps_data
chown -R user /ftps_data
chgrp -R user /ftps_data

"$@"