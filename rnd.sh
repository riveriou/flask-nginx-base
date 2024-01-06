#!/bin/bash
cp /data/static/data/*.json /dataout/
rm -rf /data
cd /
tar zxvf /dataout/data*
rm -f /data/static/data/*.json
mv /dataout/*.json /data/static/data/
