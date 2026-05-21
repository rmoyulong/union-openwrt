#!/bin/bash

cd openwrt
./scripts/feeds update -a
  
# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch



