#!/bin/bash

sed -i 's|127.0.0.1|'$LOGSTASH_IP'|g' /etc/forwarder/forwarder.conf
