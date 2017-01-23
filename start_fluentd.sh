#!/bin/bash -eu

VERSION=$1
MODE=$2

cd ~/fluentd-benchmark-${VERSION}-${MODE}/in_forward
bundle exec fluentd -c receiver.conf
