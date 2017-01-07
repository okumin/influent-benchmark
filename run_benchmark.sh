#!/bin/bash -eu

VERSION=$1
MPS=$2

rm -f /var/tmp/_var_log_dummy.pos
rm -f ~/fluentd-benchmark-${VERSION}/in_forward/dummy.log

cd ~/fluentd-benchmark-${VERSION}/in_forward
bundle exec fluentd -c agent.conf &
bundle exec dummer -c dummer.conf -r ${MPS}
