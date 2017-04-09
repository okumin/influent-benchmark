#!/bin/bash -eu

TEST_BRANCH=$1
N_THREAD=$2

mkdir -p ~/influent-log
rm -f ~/influent/influent-java-sample/target/influent-java-sample.jar

cd ~/influent
git checkout $TEST_BRANCH
sbt "project influentJavaSample" "assembly"

# enable compressed oop
java -XX:+UseG1GC -Xmx31g -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:${HOME}/influent-log/gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=8 -XX:GCLogFileSize=16m -classpath influent-java-sample/target/influent-java-sample.jar sample.Counter ${N_THREAD}
