FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

ENV LOGSTASH_IP 127.0.0.1

RUN \
    yum update -y && \
    yum install -y golang git && \
    yum clean all && \
    mkdir -p /opt/logstash/ssl && \
    cd /opt && \
    git clone git://github.com/elasticsearch/logstash-forwarder.git && \
    cd /opt/logstash-forwarder/ && \
    git checkout ISSUE-221 && \
    go build

COPY container-files /

CMD /start.sh
