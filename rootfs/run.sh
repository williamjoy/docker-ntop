#!/bin/bash
setsid /usr/bin/redis-server /etc/redis/redis.conf &
trap "{ echo Received SIGTERM, saving redis data; redis-cli <<< save ; }" SIGTERM
trap "{ echo Received SIGINT, saving redis data; redis-cli <<< save; }" SIGINT
ntopng "$@" $NTOP_CONFIG