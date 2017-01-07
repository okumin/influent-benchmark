# influent-benchmark

Build servers to test Influent and Fluentd.

## Setup

### Common

### Receiver node

```
cd ~
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git
./influent-benchmark/setup_receiver.sh
source ~/.bash_profile
```

### Sender node

```
RECEIVER_HOST={host name or ip address of target host}
cd ~
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git
./influent-benchmark/setup_sender.sh ${RECEIVER_HOST}
source ~/.bash_profile
```

## Benchmark

### 1. Start the receiver

When testing Fluentd 0.12,

```
cd ~/fluentd-benchmark-0.12/in_forward
bundle exec fluentd -c receiver.conf
```

When testing Fluentd 0.14,

```
cd ~/fluentd-benchmark-0.14/in_forward
bundle exec fluentd -c receiver.conf
```

When testing Influent,

```
TEST_BRANCH={test branch}
cd ~/influent
git checkout ${TEST_BRANCH}
sbt "project influentJavaSample" "compile" "runMain sample.Counter"
```

### 2. Start benchmark

When testing by Fluentd 0.12 protocol,

```
~/influent-benchmark/run_benchmark.sh 0.12 {message/sec}
```

When testing by Fluentd 0.14 protocol,

```
~/influent-benchmark/run_benchmark.sh 0.14 {message/sec}
```
