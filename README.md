# influent-benchmark

## Setup

### Common

Press enter when creating ssh keys on `setup.sh`.

```
$ sudo yum -y install git
$ git clone https://github.com/okumin/influent-benchmark.git
$ cd influent-benchmark/ansible
$ ./setup.sh
```

### Sender node

```
$ ansible-playbook -i load sender.yml
$ vi ~/fluentd-benchmark/one_forward/agent.conf # change the target host address
```

### Receiver node

```
$ ansible-playbook -i load receiver.yml
```

## Benchmark(Fluentd)

### 1. Start the receiver

```
$ cd ~/fluentd-benchmark/in_forward
$ bundle
$ rbenv rehash
$ bundle exec fluentd -c receiver.conf
```

### 2. Start the sender

```
$ cd ~/fluentd-benchmark/in_forward
$ bundle
$ rbenv rehash
$ bundle exec fluentd -c agent.conf
```

### 3. Run benchmark

```
$ cd ~/fluentd-benchmark/in_forward
$ bundle exec dummer -c dummer.conf -r {message/sec}
```
