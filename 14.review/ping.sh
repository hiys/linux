#!/bin/bash

for ip in 192.168.4.{1..254}
do
    ping -c2 $ip &> /dev/null && echo -e "$ip:\033[32;1mup\033[0m" || echo -e "$ip:\033[31;1mdown\033[0m" &
done
