#!/bin/bash

service proftpd stop

apt remove proftpd openssl -y

rm -rf /etc/proftpd

rm -rf /var/log/proftpd

rm -f /etc/ssl/certs/proftpd.crt
rm -f /etc/ssl/private/proftpd.key

service proftpd restart
