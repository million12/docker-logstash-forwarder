#### Logstash-Forwarder Docker Image
Build on official logstash-forwarder repo and switched to ISSUE-221 branch to fix ssl problem. 

#### Directories
Make sure your logstash-server ssl certificates are placed in /opt/ssl directory. 

Host OS log directory need to be shared with the docker container into /data/logs:

`-v /var/log:/data/log`


####RUN
Option 1: Run on the same host as logstash server

`docker run -d --name logstash-forwarder --volumes-from=logstash -v /var/log:/data/log million12/logstash-forwarder`

Option2: Run on dofferent host than logstash server 

`docker run -d --name logstash-forwarder -v /dir_with_ssl/:/opt/logstash/ssl -v /var/log:/data/log million12/logstash-forwarder`

FYI: Make sure you have copies of certificates from logstash server. 

####Logging
If you need to log more thean just system.log please edit forwarder.conf file accordigly to logstash/forwarder manual. <a href="http://logstash.net/docs/1.4.2/">LINK</a>

Otherwise you can mount directory with your host specific forwarder.conf using command -v.

`-v /your-dir:/etc/forwarder/`

Remember to use exact name (forwarder.conf). 

Full command with custom log settings:

`docker run -d --name logstash-forwarder -v /opt/ssl:/opt/logstash-forwarder/ssl -v /var/log:/data/log -v /your-dir:/etc/forwarder/ million12/logstash-forwarder`

#### forwarder.conf
Make sure you edited your forwarder.conf to send data to your logstash server. Edit IP. 
By Default IP is set to localhost.

