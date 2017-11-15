#!/bin/bash -eu

VERSION=$1
MODE=$2

cd ~/fluentd-benchmark-${VERSION}-${MODE}/in_forward
FLUENTD_WORKERS=$3 LD_PRELOAD=/usr/local/lib/libjemalloc.so bundle exec fluentd -c receiver.conf | python ~/script/flowcounter_total.py
