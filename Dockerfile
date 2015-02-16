# DOCKER-VERSION 1.0.1
# VERSION        0.5

FROM debian:jessie
MAINTAINER Justin Plock <justin@plock.net>
ENV ZK_VERSION 3.4.6
RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - \
 http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz \
 | tar -xzf - -C /opt \
 && ln -s /opt/zookeeper-${ZK_VERSION} /opt/zookeeper

ADD ./conf/zoo.cfg /opt/zookeeper/conf/zoo.cfg
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2888 3888

VOLUME ["/zk-data"]
ADD boot.sh /opt/zookeeper/boot.sh
CMD ["/opt/zookeeper/boot.sh"]
