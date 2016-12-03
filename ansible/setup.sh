#!/bin/bash

sudo yum -y install epel-release
sudo yum -y install ansible

ssh-keygen
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
