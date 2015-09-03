#!/bin/bash

apt-get update

iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

sudo apt-get install -y nginx node iptables-persistent git-core curl zip php5 php5-fpm php5-cli php5-dev php5-mysql php5-curl php5-gd subversion mongodb-org upstart

rm /etc/nginx/nginx.conf

ssh-keygen -t rsa -b 4096 -C "steven.neptune@gmail.com"

## INSTALL KEY IN GITHUB ##

cd /var/www/
git clone git@github.com:scneptune/datePathfinder.git application

rm -f /etc/nginx/sites-enabled/*
cp /var/www/.config/nginx.conf /etc/nginx/nginx.conf
ln -s /var/www/.config/datapp.local /etc/nginx/sites-enabled/dateapp.local
/etc/init.d/nginx restart

cp /var/www/.config/nodeapp.conf /etc/init/

sudo mkdir -p /data/db
sudo chmod 777 /data/db

mongod --dbpath /data/db

service mongod restart

cd /var/www/application/
npm install