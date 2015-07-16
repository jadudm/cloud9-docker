#!/bin/bash

# ------------------------------------------------------------------------------

mkdir /plumb
mkdir /tmp/plumb

pushd /plumb
  git clone https://github.com/concurrency/plumb2 .
popd
