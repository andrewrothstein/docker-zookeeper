#!/bin/sh

printf "${ZK_MYID}" > /zk-data/myid
echo starting ZK instance $(cat /zk-data/myid)...

echo installing in domain ${CLUSTER}.${ENV}.local...
sed -i "s/ZK_DNS_DOMAIN/${CLUSTER}.${ENV}.local/" /opt/zookeeper/conf/zoo.cfg

echo booting configuration:
cat /opt/zookeeper/conf/zoo.cfg

echo netstats:
netstat -l

echo launching...
/opt/zookeeper/bin/zkServer.sh start-foreground
