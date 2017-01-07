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
```

### Sender node

```
cd ~
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git
./influent-benchmark/setup_sender.sh { target host name or ip address }
```

## Benchmark

### 1. Start the sender

```
cd ~/fluentd-benchmark/in_forward
bundle
rbenv rehash
bundle exec fluentd -c agent.conf
```

### 2. Start the receiver

When testing Fluentd,

```
cd ~/fluentd-benchmark/in_forward
bundle
rbenv rehash
bundle exec fluentd -c receiver.conf
```

When testing Influent,

```
cd ~/influent
git checkout {test branch}
sbt "project influentJavaSample" compile
sbt "project influentJavaSample" "runMain sample.Counter"
```

### 3. Run benchmark

```
cd ~/fluentd-benchmark/in_forward
bundle exec dummer -c dummer.conf -r {message/sec}
```
