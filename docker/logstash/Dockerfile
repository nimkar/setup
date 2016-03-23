FROM oneops/centos7

# logstash
COPY logstash.repo /etc/yum.repos.d/logstash.repo
RUN yum -y install logstash openssl

COPY logstash.sh /opt/logstash.sh
COPY logstash.conf /etc/logstash/conf.d/logstash.conf

COPY logstash.ini /etc/supervisord.d/logstash.ini
