#!/bin/bash

sudo yum update -y
sudo yum -y install epel-release
sudo yum -y install ansible

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

source ~/.bash_profile
