#!/bin/bash

sed -i 's/PermitRootLogin yes/#PermitRootLogin prohibit-password yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin/#PermitRootLogin/' /etc/ssh/sshd_config
mkdir /root/.ssh
touch /root/.ssh/authorized_keys
mkdir /etc/nginx/ssl
#openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
