#!/bin/bash -eu

cd ~/influent-benchmark/ansible
./setup.sh

cd ~/influent-benchmark/ansible
ansible-playbook -i load receiver.yml
