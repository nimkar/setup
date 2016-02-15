#!/usr/bin/env bash

export VAGRANT_MNT="/home/vagrant/sync"

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

source /usr/local/rvm/scripts/rvm
rvm use --default --install 1.9.3
shift
gem install net-ssh -v 2.9.1
gem install rails
gem install bundler
gem install mixlib-log -v '1.6.0'

rvm cleanup all

yum install -y gcc ruby-devel zlib-devel nc bind-utils
yum -y install libxml2-devel libxslt-devel
yum -y install graphviz

cp "$VAGRANT_MNT/display/init.d/display" /etc/init.d

chkconfig --add display
chkconfig display on
