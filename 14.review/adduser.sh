#!/bin/bash

for i in {1..10}
do
    id user$i &> /dev/null
    if [ $? -ne 0 ]; then
        useradd user$i
        echo 123456 | passwd --stdin user$i &> /dev/null
        chage -d0 user$i
        echo -e "creating user$i...\t\t\033[32;1m[done]\033[0m"
    else
        echo -e "\033[31;1muser$i already exists.\033[0m"
    fi
done

