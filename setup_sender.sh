#!/bin/bash

cd ~/influent-benchmark/ansible
./setup.sh

cd ~/influent-benchmark/ansible
ansible-playbook -i load sender.yml
source ~/.bash_profile

cd ~/fluentd-benchmark/in_forward
bundle
rbenv rehash
