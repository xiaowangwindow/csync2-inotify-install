#!/bin/bash

#add host
sudo echo "192.168.1.2 host1" >> /etc/hosts
sudo echo "192.168.1.3 host2" >> /etc/hosts
sudo echo "192.168.1.4 host4" >> /etc/hosts

#add csync2 to services
sudo echo "csync2 30865/tcp" >> /etc/services

#add csync2 config to xinetd
sudo echo "service csync2
{
disable = no
protocol = tcp
flags = REUSE
socket_type = stream
wait = no
user = root
group = root
server = /usr/local/sbin/csync2
server_args = -i
}" > /etc/xinetd.d/csync2
sudo chkconfig xinetd on

#config csync2.cfg
sudo echo "nossl * *;
group host_group
{
    host host1, host2, host3;
    key /etc/csync2.key;
    include /opt/www/csync2_data/;
    auto younger;
}" > /etc/csync2.cfg

#make a soft link for running inotify
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ]; then
    #64bit system
    ln -s /usr/local/lib/libinotifytools.so.0 /usr/lib64/libinotifytools.so.0
else
    #32bit system
    ln -s /usr/local/lib/libinotifytools.so.0 /usr/lib/libinotifytools.so.0
fi
