#!/bin/bash

RECEIVER_HOST=$1

cd ~/influent-benchmark/ansible
./setup.sh

cd ~/influent-benchmark/ansible
ansible-playbook -i load sender.yml --extra-vars "receiver_host=${RECEIVER_HOST}"
source ~/.bash_profile
