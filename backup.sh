#!/bin/bash

rm /*site.tar.gz
rm /*data.tar.gz


date="$(date +'%Y-%m%d-%H:%M:%S')"
tar zcvf /web_site.tar.gz /data
tar zcvf /web_site_data.tar.gz /data/static/data
