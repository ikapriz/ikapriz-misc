#!/bin/bash -l

ip1='10.48.0.0'
#ip1='192.168.64.0'
iplist=("10.4.125.95" "10.10.109.208" "10.10.168.208" "10.12.124.4" "10.13.80.62" "10.13.90.24" "10.13.90.25" "10.17.13.201" "10.18.120.136" "10.23.83.129" "10.4.132.32" "10.4.15.210")
line=$(route print $ip1|grep $ip1)
IFS=' ' read -r -a array <<< "$line"
echo "${array[2]}"
for i in "${iplist[@]}"
do
echo $i
res=$(route delete $i)
echo $res
res=$(route -p add $i ${array[2]})
echo $res
done
