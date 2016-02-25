FROM centos
MAINTAINER Nikolay Kondratyev <nkondratyev@yandex.ru>

RUN yum install -y java-1.8.0-openjdk.x86_64
RUN yum install -y tar
RUN yum install -y wget

RUN mkdir /hbase-setup
WORKDIR /hbase-setup

COPY install.sh ./
RUN ./install.sh

ENV JAVA_HOME=/usr
RUN /opt/hbase/bin/hbase-config.sh

COPY hbase-site.xml /opt/hbase/conf/hbase-site.xml

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

WORKDIR /opt/hbase/bin
ENV PATH=$PATH:/opt/hbase/bin
CMD /opt/hbase/bin/start-hbase.sh
