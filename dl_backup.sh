#!/bin/bash


date="$(date +'%Y%m%d-%H%M%S')"
cd /root/backup/

wget --header="Cookie:admin=True;cname=tw-docker-root-corntab-auto" https://sales.jyet.com.cn:8443/admin/download/1 --no-check-certificate -O website-$date.tar.gz

wget --header="Cookie:admin=True;cname=tw-docker-root-corntab-auto" https://sales.jyet.com.cn:8443/admin/download/2 --no-check-certificate -O website-data-only-$date.tar.gz






