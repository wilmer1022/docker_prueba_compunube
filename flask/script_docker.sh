#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl status docker
sudo docker info | more
#sudo docker login --username nombreusuario --password contraseña
sudo docker build -t wilmer1022/flaskubuntuserver .
sudo docker run --name flasktest -d -p 9000:5000 wilmer1022/flaskubuntuserver
sudo docker container ls -a