#!/bin/bash
echo "#hosts lines to append" > hosts
for i in $(vagrant status | grep "running" | grep "windows" | awk '{printf "%s ", $1}' | sed 's/ $//');
do
    IP=$(vagrant winrm $i -c "(Get-NetIPAddress -AddressFamily IPv4).IPAddress" | grep "192.168.0" | tr -d '[:space:]')
    i=$(echo "$i" | tr -d '[:space:]')
    echo "$IP $i" | tee -a hosts
done
