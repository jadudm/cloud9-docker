#!/bin/bash

# ------------------------------------------------------------------------------

# Build mosquitto
#mkdir /mosquitto
#pushd /mosquitto
#  curl -sL -o mosquitto-1.4.2.tgz http://mosquitto.org/files/source/mosquitto-1.4.2.tar.gz
#  tar xvzf mosquitto-1.4.2.tgz
#  pushd mosquitto-1.4.2
#    make
#    make install
#  popd
#popd


curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -y nodejs

git clone https://github.com/c9/core.git /cloud9
pushd /cloud9
  scripts/install-sdk.sh
popd

# Tweak standlone.js conf
sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js

# Append to .bashrc
# Configure the occam tools.
echo "source /usr/local/kroc-avr/bin/avr-kroc-setup.sh" >> /root/.bashrc
