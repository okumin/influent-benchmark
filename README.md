# influent-benchmark

## Setup

### Common

Press enter when creating ssh keys on `setup.sh`.

```
sudo yum -y install git
git clone https://github.com/okumin/influent-benchmark.git
cd influent-benchmark/ansible
./setup.sh
```

### Sender node

```
ansible-playbook -i load sender.yml
vi ~/fluentd-benchmark/one_forward/agent.conf # change the target host address
source ~/.bash_profile
```

### Receiver node

```
ansible-playbook -i load receiver.yml
source ~/.bash_profile
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
