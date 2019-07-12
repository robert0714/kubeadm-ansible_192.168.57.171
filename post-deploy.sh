#!/bin/bash
value=$( grep -ic "entry" /etc/hosts )
if [ $value -eq 0 ]
then
echo "
################ ceph-cookbook host entry ############
192.168.57.171 k8s-m1
192.168.57.172 k8s-m2
192.168.57.173 k8s-m3
192.168.57.181 k8s-e1
192.168.57.182 k8s-e2
192.168.57.183 k8s-e3
192.168.57.191 k8s-n1
192.168.57.192 k8s-n2
192.168.57.193 k8s-n3
######################################################
" >> /etc/hosts
fi
if [ -e /etc/redhat-release ]
then
systemctl stop ntpd
systemctl stop ntpdate
ntpdate 0.centos.pool.ntp.org > /dev/null 2> /dev/null
systemctl start ntpdate
systemctl start ntpd
