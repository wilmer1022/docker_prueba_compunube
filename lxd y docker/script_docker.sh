#!/bin/bash

sudo apt install snapd
sudo snap install lxd
lxd --version
newgrp lxd
lxd init --auto
lxc remote add images images.linuxcontainers.org
lxc launch ubuntu:20.04 dockerserver -c security.nesting=true
lxc config set dockerserver security.privileged true
lxc restart dockerserver
lxc image list
lxc list
lxc info dockerserver | more
lxc config show dockerserver
sudo apt install net-tools
systemctl status apache2
lxc exec dockerserver -- apt update
lxc exec dockerserver -- apt install docker.io -y
lxc file push /home/vagrant/index.html dockerserver/root/index.html
lxc file push /home/vagrant/Dockerfile dockerserver/root/Dockerfile
lxc exec dockerserver -- docker build -t wilmer1022/apacheubuntudockerserver .
lxc exec dockerserver -- docker run --name apachetest -d -p 9000:80 wilmer1022/apacheubuntudockerserver
lxc info dockerserver | more
ifconfig | more
lxc config device add dockerserver myport80 proxy listen=tcp:192.168.100.5:5080 connect=tcp:127.0.0.1:9000
sudo lsof -i | grep 5080