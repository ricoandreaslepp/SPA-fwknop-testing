#!/usr/bin/env bash

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -S

mkdir -p /etc/fwknop/

yes Y  | cp config/totp_access.conf /etc/fwknop/access.conf
yes Y  | cp config/fwknopd.conf /etc/fwknop/

while true; do
    sleep 100
done
