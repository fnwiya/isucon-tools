#!/bin/bash

cat /var/log/nginx/access.log | cut -f6,7,14 -d ' ' | sort -k3nr
