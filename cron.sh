#!/bin/bash

while :

do
	sleep 86400

	date="$(date +'%Y-%m%d-%H:%M:%S')"
	tar zcvf /web_site-$date.tar.gz /data
	tar zcvf /web_site_data-$date.tar.gz /data/static/data

done
