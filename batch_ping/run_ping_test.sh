#!/bin/bash

# first step
# generate ip file

ip_range_file="ip_range_recommend.txt"
ip_file_save="ip_recommend.txt"
# ./ip_range_generate/ip_generate.sh $ip_range_file > $ip_file_save

# run test
# in Linux
# commend ipfile per_count parallel
time=$(date "+%Y.%m.%d_%H.%M.%S")
result_save=$(echo $time"_result.csv")
system=$1
ip_count=$2
ip_parallel=$3
ip_select=$4

if [[ "$ip_count" == "" ]] ; then
    ip_count=20
fi

if [[ "$ip_parallel" == "" ]] ; then
    ip_parallel=32
fi

if [ "$ip_select" != "" ] ; then
    ip_file_save=$ip_select
fi

echo file is $ip_file_save
echo pre ping count is $ip_count
echo parallel ping is $ip_parallel
echo save as $result_save
read

case "$system" in
    Linux | linux )
        echo "Platform is Linux"
        ./ip_excute/ip_ping.sh $ip_file_save $ip_count $ip_parallel | tee $result_save
        ;;
    Windows | windows | win )
        echo "Platfrom is Windows"
        ./ip_excute/ip_ping_win.sh $ip_file_save $ip_count $ip_parallel | tee $result_save
        ;;
    *) 
        echo "Please select platform"
        echo "linux or win"
        ;;
esac

# ./ip_ping.sh ip_file.txt 20 10 | tee $result_save
