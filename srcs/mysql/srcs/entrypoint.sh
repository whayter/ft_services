#!/bin/sh

sh init_db.sh & PIDIOS=$!
sh init.sh & PIDMIX=$!
wait $PIDIOS
wait $PIDMIX