#!/bin/bash

# ------------------------------------------------------------------------------

mkdir -p /plumb
mkdir /tmp/plumb

pushd /plumb
  #git clone https://github.com/concurrency/plumb2 .
  echo "Making an executable of plumb"
  #raco exe -o plumb.exe plumb.rkt
  echo "Done creating executable."
  #chmod 755 plumb.exe
  #cp plumb.exe /usr/local/bin/plumb.exe

  chmod 755 /usr/local/bin/plumb
popd

# Append to .bashrc
# Configure the occam tools.
echo "source /usr/local/kroc-avr/bin/avr-kroc-setup.sh" >> /root/.bashrc
