### Logstash-Forwarder Docker Image
[Logstash Forwarder](https://github.com/elasticsearch/logstash-forwarder) [Docker Image](https://registry.hub.docker.com/u/million12/logstash-forwarder/) for logstash/elasticsearch logging deployments. 
Build from official logstash-forwarder repo and switched to ISSUE-221 branch to fix ssl problem. 

### SSL Certificates and Log Files 
Logstash server ssl certificates need to be placed in `/etc/logstash/ssl/` directory. 

Default config is set to read `system.log` file from `/data/log/system.log`.  
Example of sharing system log with docker image.
  
`-v /var/log/system.log:/data/log/system.log`

### Logstash IP (Environmental Variable) 
`$LOGSTASH_IP` environmental variable with IP address to logstash server. 

### RUN
Run on the same host as logstash server

`docker run \`  
`-d --name forwarder \`  
`-e LOGSTASH_IP=logstash_server_ip \`  
`-v /var/log/system.log:/data/log/system.log \`   
`-v /etc/logstash/ssl:/logstash/ssl \`  
`million12/logstash-forwarder`

FYI: Certificates should match logstash server certificates. 

### Logging
If you need to log more than just system.log please edit forwarder.conf file according the [logstash/forwarder manual](http://logstash.net/docs/1.4.2/).

Otherwise you can mount the directory with your host specific forwarder.conf using command -v.
`-v /your-dir:/etc/forwarder/`

### Authors

Author: Marcin Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)  

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
