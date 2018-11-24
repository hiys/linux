#!/bin/bash

if [ $# -ne 2 ]; then
    echo "usage: $0 ipfile 'command'"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "No such file:" $1
    exit 2
fi

ipfile=$1
comm=$2
stty -echo
read -p "password: " password
stty echo

for ip in $(cat "$ipfile")
do
    expect <<EOF
    spawn ssh root@$ip "$comm"
    expect "(yes/no)?" {
        send "yes\r"
        expect "password:"
        send "$password\r"
    } "password:" { send "$password\r" }
    expect eof
EOF
done
