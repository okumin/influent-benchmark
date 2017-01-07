#!/bin/bash

cd ~/influent-benchmark/ansible
./setup.sh

cd ~/influent-benchmark/ansible
ansible-playbook -i load receiver.yml
source ~/.bash_profile
