#!/bin/bash

mkdir -p /var/run/sshd
echo 'root:root' | chpasswd

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
