#!/bin/bash -eu

RECEIVER_HOST=$1
ping -c 1 $RECEIVER_HOST

cd ~/influent-benchmark/ansible
./setup.sh

cd ~/influent-benchmark/ansible
ansible-playbook -i load sender.yml --extra-vars "receiver_host=${RECEIVER_HOST}"
