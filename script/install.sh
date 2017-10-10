#!/bin/bash

sudo apt-get install -y memcached python-pip
# netdata https://github.com/firehol/netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
