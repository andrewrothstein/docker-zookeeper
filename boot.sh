#!/bin/sh

printf "${ZK_MYID}" > /zk-data/myid
printf "starting ZK instance $(cat /zk-data/myid)..."
/opt/zookeeper/bin/zkServer.sh start-foreground
