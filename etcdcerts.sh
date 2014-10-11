#!/bin/bash

# Fetch certificate and key from logstash server 
cd /opt/logstash/ssl
curl -O http://$LOGSTASH_IP:4001/v2/keys/fwdkey 
sed 's/^.*-----BEGIN PRIVATE KEY-----/-----BEGIN PRIVATE KEY-----/' fwdkey > fwdkey-new
mv fwdkey-new fwdkey
sed 's/-----END PRIVATE KEY-----.*$/-----END PRIVATE KEY-----/' fwdkey > fwdkey-new
mv fwdkey-new fwdkey
sed 's/\\n/\n/g' fwdkey > fwdkey-new
mv fwdkey-new fwdkey
mv fwdkey logstash-forwarder.key


curl -O http://$LOGSTASH_IP:4001/v2/keys/fwdcrt 
sed 's/^.*-----BEGIN CERTIFICATE-----/-----BEGIN CERTIFICATE-----/' fwdcrt > fwdcrt-new
mv fwdcrt-new fwdcrt
sed 's/-----END CERTIFICATE-----.*$/-----END CERTIFICATE-----/' fwdcrt > fwdcrt-new
mv fwdcrt-new fwdcrt
sed 's/\\n/\n/g' fwdcrt > fwdcrt-new
mv fwdcrt-new fwdcrt
mv fwdcrt logstash-forwarder.crt