#!/bin/bash -eu

VERSION=$1
BRANCH=$2
MPS=$3

rm -f /var/tmp/_var_log_dummy.pos
rm -f ~/fluentd-benchmark-${VERSION}/in_forward/dummy.log

cd ~/fluentd-benchmark-${VERSION}/in_forward
git checkout $BRANCH
bundle exec fluentd -c agent.conf &
bundle exec dummer -c dummer.conf -r ${MPS}
