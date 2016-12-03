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
$ ansible-playbook -i load receiver.yml
$ ~/fluentd-benchmark/one_forward/agent.conf # change the target host address
```

### Receiver node

```
$ ansible-playbook -i load receiver.yml
```
