#!/bin/bash

# ------------------------------------------------------------------------------

mkdir /plumb
mkdir /tmp/plumb

pushd /plumb
  git clone https://github.com/concurrency/plumb2 .
popd

# Append to .bashrc
# Configure the occam tools.
echo "source /usr/local/kroc-avr/bin/avr-kroc-setup.sh" >> /root/.bashrc
