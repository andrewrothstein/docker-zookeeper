#!/bin/sh

printf "${ZK_MYID}" > /zk-data/myid
echo starting ZK instance $(cat /zk-data/myid)...
echo installing in domain ${CLUSTER}.${ENV}.local...
sed -i "s/ZK_DNS_DOMAIN/${CLUSTER}.${ENV}.local/" /opt/zookeeper/conf/zoo.cfg
echo
echo digging for peers...
dig zookeeper-1.${CLUSTER}.${ENV}.local
dig zookeeper-2.${CLUSTER}.${ENV}.local
dig zookeeper-3.${CLUSTER}.${ENV}.local
echo
echo pinging my peers...
ping -c 5 zookeeper-1.${CLUSTER}.${ENV}.local
ping -c 5 zookeeper-2.${CLUSTER}.${ENV}.local
ping -c 5 zookeeper-3.${CLUSTER}.${ENV}.local
echo
echo booting configuration:
cat /opt/zookeeper/conf/zoo.cfg
echo
echo pre-boot netstats:
netstat -l
echo
echo launching zookeeper...
/opt/zookeeper/bin/zkServer.sh start-foreground
