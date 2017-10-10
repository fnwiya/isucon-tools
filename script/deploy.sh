#!/bin/bash
set -ex

git push
ssh vagrant@buono.fdev "cd /data/repo && git reset --hard && git log -n 1 | /home/isucon/slack.sh"
ssh vagrant@buono.fdev "if [ -f /var/log/mysql/slow.log ]; then sudo mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$(date +\"%Y%m%d_%H%M%S\") ;fi"
ssh vagrant@buono.fdev "if [ -f /var/log/nginx/access.log ]; then sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.$(date +\"%Y%m%d_%H%M%S\") ;fi"
ssh vagrant@buono.fdev "sudo systemctl restart mysql && sudo systemctl restart memcached && sudo systemctl restart isuda.python && sudo systemctl restart isutar.python && sudo systemctl restart nginx && echo 'restarted' | /home/isucon/slack.sh"
ssh vagrant@buono.fdev "cd /home/isucon/isucon6q && sudo -u isucon ./isucon6q-bench -target http://127.0.0.1 | /home/isucon/slack.sh"
