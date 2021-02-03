#!/bin/sh

until mysql
do
	echo "Starting mysql..."
done

mysql < db.sql
mysql wordpress < wordpress.sql