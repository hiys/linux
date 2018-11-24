#!/bin/bash

expect <<EOF
    spawn virsh console rh6_node01
    expect "]"
    send "\r"
    expect "login:"
    send "root\r"
    expect "Password:"
    send "Taren1\r"
    interact
EOF
