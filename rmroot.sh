#!/bin/bash

sed -i 's/PermitRootLogin yes/#PermitRootLogin prohibit-password yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin/#PermitRootLogin/' /etc/ssh/sshd_config
