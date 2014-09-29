FROM million12/centos-supervisor
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

ADD forwarder.conf /etc/forwarder.conf

RUN \
yum update -y && \
yum install -y golang git && \
yum clean all && \
cd /opt && \
git clone git://github.com/elasticsearch/logstash-forwarder.git && \
cd /opt/logstash-forwarder/ && \
git checkout ISSUE-221 && \
go build

ADD supervisord.conf /etc/supervisor.d/logstash-forwarder.conf 