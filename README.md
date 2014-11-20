#### Logstash-Forwarder Docker Image
Build from official logstash-forwarder repo and switched to ISSUE-221 branch to fix ssl problem. 

#### Directories
Make sure your logstash-server ssl certificates are placed in /opt/ssl directory. 

Host OS log directory needs to be shared with the docker container on /data/logs:

`-v /var/log:/data/log`

#### Logstash IP (Environmental Variable) 
Use $LOGSTASH_IP environmental variable to redirect data to logstash server. 

####RUN
Option 1: Run on the same host as logstash server

`docker run -d --name logstash-forwarder -e LOGSTASH_IP=logstash_server_ip --volumes-from=logstash -v /var/log:/data/log million12/logstash-forwarder`

Option2: Run on different host than logstash server 

`docker run -d --name logstash-forwarder -e LOGSTASH_IP=logstash_server_ip -v /dir_with_ssl/:/opt/logstash/ssl -v /var/log:/data/log million12/logstash-forwarder`

FYI: Make sure you have copies of certificates from logstash server. 

####Logging
If you need to log more than just system.log please edit forwarder.conf file according the <a href="http://logstash.net/docs/1.4.2/">logstash/forwarder manual</a>.

Otherwise you can mount the directory with your host specific forwarder.conf using command -v.

`-v /your-dir:/etc/forwarder/`

Remember to use exact name (forwarder.conf). 

Full command with custom log settings:

`docker run -d --name logstash-forwarder -e LOGSTASH_IP=logstash_server_ip -v /opt/ssl:/opt/logstash-forwarder/ssl -v /var/log:/data/log -v /your-dir:/etc/forwarder/ million12/logstash-forwarder`

#### forwarder.conf
Make sure you edited your forwarder.conf to send data to your logstash server. Edit IP. 
By Default IP is set to localhost.


---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
