# netflix.dnsmasq
安装方法
wget https://raw.githubusercontent.com/guolongchu/netflix.dnsmasq/master/unlock.sh && chmod +x unlock.sh && ./unlock.sh 你的你个BGP解锁IP

若是不需要用解锁了，直接把VPS文件 /etc/resolv.conf 里面的 127.0.0.1 ，换为你原来的DNS IP就可以了。一般来说是 8.8.8.8 和 8.8.4.4

可使用chattr +i /etc/resolv.conf进行文件加锁，解锁chattr -i /etc/resolv.conf，C7以外的系统加锁会提示错误等信息，自行百度谷歌。
dnsmasq分流只适用于科学服务端使用系统的DNS。

自定义dnsmasq的配置
配置文件目录路径 /etc/dnsmasq.d/unlock.conf 。
修改完成重启dnsmasq。（重启命令systemctl restart dnsmasq）
最后重启代理工具
