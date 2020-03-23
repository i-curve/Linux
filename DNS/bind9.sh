#!/bin/bash
echo '即将安装域名解析服务器'
read -p 'Y/N:' check

apt-get update
apt-get install -y bind9
cd /etc/bind

cat >> name.conf.options <<EOF
options {
    directory "/var/cache/bind";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //  0.0.0.0;
    // };
     forwarders {
        8.8.8.8;
        8.8.4.4;
        223.5.5.5;
        223.6.6.6;
        127.0.0.53;
     };
    listen-on port 53{any;};
    allow-query {any;};
    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    dnssec-validation auto;

    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };
};
EOF

service bind9 restart
