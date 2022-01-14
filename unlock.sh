#!/bin/bash

if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum install bind-utils
    yum install -y dnsmasq
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
else
    echo "This script only supports CentOS, Ubuntu and Debian."
    exit 1
fi

if [ $? -eq 0 ]; then
    systemctl enable dnsmasq
    rm -f /etc/resolv.conf
    echo "nameserver 127.0.0.1" > /etc/resolv.conf
    touch /etc/dnsmasq.d/unlock.conf
    echo "server=8.8.8.8" > /etc/dnsmasq.d/unlock.conf
    echo "server=8.8.4.4" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixtechblog.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxext.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflximg.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflximg.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxsearch.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxso.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/nflxvideo.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest0.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest1.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest2.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest3.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest4.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest5.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest6.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest7.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest8.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/netflixdnstest9.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/cdn.registerdisney.go.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/adobedtm.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/bam.nr-data.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/bamgrid.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/braze.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/cdn.optimizely.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/cws.conviva.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/d9.flashtalking.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disney-plus.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disney-portal.my.onetrust.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disney.demdex.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disney.my.sentry.io/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disneyplus.bn5x.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disneyplus.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disneyplus.com.ssl.sc.omtrdc.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/disneystreaming.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/dssott.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/execute-api.us-east-1.amazonaws.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/js-agent.newrelic.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/hulu.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/huluim.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/aiv-cdn.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/amazonaws.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/amazonvideo.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/llnwd.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/amazonprimevideos.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/amazonvideo.cc/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/prime-video.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/primevideo.cc/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/primevideo.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/primevideo.info/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/primevideo.org/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "server=/primevideo.tv/$1" >> /etc/dnsmasq.d/unlock.conf
    
    systemctl restart dnsmasq
    echo "dnsmasq启动成功"
else
    echo "dnsmasq安装失败, 请检查仓库状况"
fi
