#!/bin/sh

until mysql
do
    sleep 0.5
done

mysql < worddpress.sql