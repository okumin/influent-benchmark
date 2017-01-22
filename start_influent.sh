#!/bin/bash -eu

TEST_BRANCH=$1

mkdir -p ~/influent-log
rm ~/influent/influent-java-sample/target/influent-java-sample.jar

cd ~/influent
git checkout $TEST_BRANCH
sbt "project influentJavaSample" "assembly"

java -XX:+UseG1GC -Xmx16g -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:~/influent-log/gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=8 -XX:GCLogFileSize=16m -classpath influent-java-sample/target/influent-java-sample.jar sample.Counter
