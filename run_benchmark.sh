#!/bin/bash -eu

VERSION=$1
MODE=$2
MPS=$3

rm -f /var/tmp/_var_log_dummy.pos
rm -f ~/fluentd-benchmark-${VERSION}-${MODE}/in_forward/dummy.log

cd ~/fluentd-benchmark-${VERSION}-${MODE}/in_forward
LD_PRELOAD=~/jemalloc/lib/libjemalloc.so bundle exec fluentd -c agent.conf &
LD_PRELOAD=~/jemalloc/lib/libjemalloc.so bundle exec dummer -c dummer.conf -r ${MPS}
