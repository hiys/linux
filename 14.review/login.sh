#!/bin/bash

A=1

read -p "how much machine:" NUM
  
while [ $A -le $NUM ];
do
   /usr/bin/expect<<EOF
   spawn virsh console rh7_node0$A
   expect "]"
   send \r
   expect "login:"
   send root\n
   expect "Password:"
   send Taren1\n
   expect "#"
   send "nmcli connection modify eth0 ipv4.method manual ipv4.addresse 192.168.4.$A/24\n"
   expect eof
EOF
   A=$[$A+1]
done
