FROM ubuntu:latest
MAINTAINER River riou

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update
RUN apt-get update --fix-missing
RUN apt-get install -y curl wget vim nano lsof net-tools dialog software-properties-common less unzip gpg-agent less unzip apt-utils
RUN apt-get install -y openssh-server supervisor python3 python3-pip nginx cron tzdata
RUN pip install flask uwsgi pandas

#RUN apt-get install -y 

RUN ln -snf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && echo Asia/Taipei > /etc/timezone
run dpkg-reconfigure -f noninteractive tzdata 

RUN apt-get clean

VOLUME /out
WORKDIR /data
ADD . /data
RUN chmod 755 /data/*

RUN /data/ssh.sh
RUN cat ./default > /etc/nginx/sites-available/default

#RUN rm -r /data/*.sh

RUN echo "[supervisord] " >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "nodaemon=true" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "user=root" >> /etc/supervisor/conf.d/supervisord.conf

RUN echo '#!/bin/sh' >> /startup.sh
RUN echo '/usr/sbin/sshd -D &' >> /startup.sh
RUN echo '#python3 /data/app.py &' >> /startup.sh
RUN echo '#nohup uwsgi --ini /data/flask_uwsgi.ini &' >> /startup.sh
RUN echo '#/usr/sbin/nginx &' >> /startup.sh
RUN echo '/cron.sh &' >> /startup.sh
RUN echo 'exec supervisord -c /etc/supervisor/supervisord.conf' >> /startup.sh

RUN chmod +x /startup.sh

EXPOSE  22
EXPOSE  80
EXPOSE  443
EXPOSE  8000
EXPOSE  8080
EXPOSE  8443

CMD ["/startup.sh"]
