#!/bin/bash

apt update
apt upgrade -y

apt install proftpd -y

cat <<EOF > /etc/proftpd/proftpd.conf
# Configuration du serveur FTP

ServerName "MonServeurFTP"
DefaultRoot ~
RequireValidShell off

<IfModule mod_tls.c>
  TLSEngine on
  TLSLog /var/log/proftpd/tls.log
  TLSProtocol TLSv1.2
  TLSRSACertificateFile /etc/proftpd/ssl/proftpd.crt
  TLSRSACertificateKeyFile /etc/proftpd/ssl/proftpd.key
</IfModule>

UseUnicode on
DefaultCharset UTF-8

AuthUserFile /etc/proftpd/ftpd.passwd
AuthGroupFile /etc/proftpd/ftpd.group
RequireValidShell off
EOF

mkdir /var/log/proftpd
touch /var/log/proftpd/tls.log
chown proftpd:adm /var/log/proftpd/tls.log

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/proftpd/ssl/proftpd.key -out /etc/proftpd/ssl/proftpd.crt -days 365

service proftpd restart
