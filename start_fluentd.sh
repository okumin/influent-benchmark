#!/bin/bash -eu

VERSION=$1
MODE=$2

cd ~/fluentd-benchmark-${VERSION}-${MODE}/in_forward
FLUENTD_WORKERS=$3 bundle exec fluentd -c receiver.conf
