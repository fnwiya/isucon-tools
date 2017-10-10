#!/bin/bash

cat /var/log/mysql/slow.log | grep -n Query | sort -k3r
