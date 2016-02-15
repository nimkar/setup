#!/bin/sh

mkdir -p /home/oneops
cd /home/oneops

export BUILD_BASE='/home/oneops/build'
export OO_HOME='/home/oneops'
export GITHUB_URL='https://github.com/oneops'

mkdir -p $BUILD_BASE

if [ -d "$BUILD_BASE/dev-tools" ]; then
  echo "doing git pull on dev-tools"
  cd "$BUILD_BASE/dev-tools"
  git pull
else
  echo "doing dev tools git clone"
  cd $BUILD_BASE
  git clone "$GITHUB_URL/dev-tools.git"
fi
sleep 2

cd $OO_HOME

cp $BUILD_BASE/dev-tools/setup-scripts/* .

source /usr/local/rvm/scripts/rvm
rvm use --default --install 1.9.3

./oneops_build.sh

now=$(date +"%T")
echo "All done at : $now"
