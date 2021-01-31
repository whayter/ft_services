#!/bin/sh

adduser -D usr
echo "usr:password" | chpasswd

"$@"