#!/bin/bash

set -u
set -e

if [ "$LOGSTASH_IP"  != "127.0.0.1" ]; then
    sed -i 's|127.0.0.1|'$LOGSTASH_IP'|g' /etc/logstash/forwarder.conf
fi

/opt/logstash-forwarder/logstash-forwarder -config /etc/logstash/forwarder.conf