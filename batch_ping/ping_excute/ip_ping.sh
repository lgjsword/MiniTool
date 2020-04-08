#!/usr/bin/bash

one_address_test() {
    # address 
    ip=$1
    count=$ip_count
    pout=$(ping -c $count $ip | grep -E "rtt|loss")
    # echo $pout
    param=$(echo $pout | gawk -F '[ ]' '{printf "%s,%s,%s,%s,%s\n", $1,$4,$6,$10,$14}')
    loss=$(echo $param | gawk -F '[,]' '{print $3}')
    rtt_ori=$(echo $param | gawk -F '[,]' '{print $5}')
    rtt=$(echo $rtt_ori | gawk -F '[/]' '{printf "%s,%s,%s,%s", $1,$2,$3,$4}')
    echo $ip,$loss,$rtt
}

#one_address_test sh.cono.fun >> test_result.csv

para_address_test() {
    ip_file=$1
    parallel=$ip_parallel
    start=1
    ((end=$start+$parallel))
    # while (( $(wc -l $ip_file | gawk -F '[ ]' '{print $1}') > $start )) ; 
    while (( $( cat $ip_file | wc -l ) > $start )) ; 
    do
        for ip in $(sed -n "$start,$end p" $ip_file)
        do {
            one_address_test $ip 
        }&
        done
        wait
        ((start=$start+$parallel+1))
        ((end=$start+$parallel))
    done
}

ip_file_name=$1
ip_count=$2
ip_parallel=$3


# ./ip_ping.sh ip_file count parallel
# Linux version
echo "ip,loss,min,average,max,mdev"
para_address_test $1 $2 $3



