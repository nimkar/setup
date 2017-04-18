FROM centos:7

RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum -y update; yum clean all

# common
RUN yum install -y supervisor sudo openssl file git wget vim-common which tar zip unzip net-tools perl-Digest-SHA
RUN yum groupinstall -y "Development tools"

# java
RUN yum -y install java-1.8.0-openjdk-devel

# ruby
RUN yum -y install ruby ruby-libs ruby-devel zlib-devel libxml2-devel libxslt-devel postgresql-libs postgresql-devel ruby-rdoc rubygems
RUN gem install bundler --no-rdoc --no-ri
RUN gem install rake --no-rdoc --no-ri

# certs
RUN mkdir -p /etc/pki/tls/logstash/certs /etc/pki/tls/logstash/private
RUN openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout /etc/pki/tls/logstash/private/logstash-forwarder.key -out /etc/pki/tls/logstash/certs/logstash-forwarder.crt -subj '/CN=*.oo.com/'

CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisord.conf"]
