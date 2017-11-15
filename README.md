# influent-benchmark

Build servers to test Influent and Fluentd.

## Terraform

### Requirements

* GCP
* High CPU quota
  * a sender node uses 32 cpus
  * a reciver node uses 64 cpus

### Configuration

Edit [google.tf](https://github.com/okumin/influent-benchmark/tree/master/terraform/providers/google/google.tf).

## Ansible

### Requirements

* CentOS 7

### Setup

#### Receiver node

```
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git ~/influent-benchmark
~/influent-benchmark/setup_receiver.sh
source ~/.bash_profile
cd ~/influent
sbt compile
```

#### Sender node

```
RECEIVER_HOST=influent-receiver001 # host name or ip address of the target
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git ~/influent-benchmark
~/influent-benchmark/setup_sender.sh ${RECEIVER_HOST}
source ~/.bash_profile
```

### Benchmark

#### 1. Start the receiver

When testing Fluentd,

* version: 0.12 or 0.14

```
~/influent-benchmark/start_fluentd.sh {version} {parallelism}
```

When testing Influent,

```
~/influent-benchmark/start_influent.sh {test branch} {parallelism}
```

#### 2. Start benchmark

* version: 0.12 or 0.14
* mode: at-most-once or at-least-once
* message/sec: message per sec

```
~/influent-benchmark/run_benchmark.sh {version} {mode} {message/sec}
```
