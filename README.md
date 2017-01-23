# influent-benchmark

Build servers to test Influent and Fluentd.

## Requirements

* CentOS 7

## Setup

### Receiver node

```
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git ~/influent-benchmark
~/influent-benchmark/setup_receiver.sh
source ~/.bash_profile
```

### Sender node

```
RECEIVER_HOST={host name or ip address of target host}
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git ~/influent-benchmark
~/influent-benchmark/setup_sender.sh ${RECEIVER_HOST}
source ~/.bash_profile
```

## Benchmark

### 1. Start the receiver

When testing Fluentd,

* version: 0.12 or 0.14
* mode: at-most-once or at-least-once

```
~/influent-benchmark/start_fluentd.sh {version} {mode}
```

When testing Influent,

```
~/influent-benchmark/start_influent.sh {test branch}
```

### 2. Start benchmark

* version: 0.12 or 0.14
* mode: at-most-once or at-least-once
* message/sec: message per sec

```
~/influent-benchmark/run_benchmark.sh {version} {mode} {message/sec}
```
