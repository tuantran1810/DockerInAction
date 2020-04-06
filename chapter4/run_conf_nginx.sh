#!/bin/sh

ATDIR=$( pwd )
CONF_SRC=$ATDIR/example.conf;
CONF_DST=/etc/nginx/conf.d/default.conf;
LOG_SRC=$ATDIR/example.log
LOG_DST=/var/log/nginx/custom.host.access.log

docker run -d --rm --name diaweb \
	--mount type=bind,src=$CONF_SRC,dst=$CONF_DST,readonly=true \
	--mount type=bind,src=$LOG_SRC,dst=$LOG_DST \
	-p 80:80 \
	nginx:latest

