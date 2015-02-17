#!/bin/sh

printf "${ZK_MYID}" > /zk-data/myid
printf "starting ZK instance $(cat /zk-data/myid)..."

printf "installing in domain ${CLUSTER}.${ENV}.local..."
sed -i "s/ZK_DNS_DOMAIN/${CLUSTER}.${ENV}.local/" /opt/zookeeper/conf/zoo.cfg
/opt/zookeeper/bin/zkServer.sh start-foreground
