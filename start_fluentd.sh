#!/bin/bash -eu

VERSION=$1
MODE=$2

# There is no difference between at-most-once and at-least-once on receiver's side.
cd ~/fluentd-benchmark-${VERSION}-at-least-once/in_forward
FLUENTD_WORKERS=$3 LD_PRELOAD=~/jemalloc/lib/libjemalloc.so bundle exec fluentd -c receiver.conf | python ~/script/flowcounter_total.py
