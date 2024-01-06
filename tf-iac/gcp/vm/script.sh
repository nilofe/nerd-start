#!/bin/bash

# update packages
sudo apt update

# install docker
sudo snap install docker 

# docker pull & run container default test
sudo docker pull nilofe/test-challege-ia:main 
sudo docker run -d -p 80:8000 --name dev-a nilofe/test-challege-ia:main
