#!/bin/bash
#remove # line
file=$1
for field in $(sed '/#/d' $file) 
do
    IPA=$(echo $field | gawk -F '[,]' '{print $1}')
    IPB=$(echo $field | gawk -F '[,]' '{print $2}')
    ./ip_range.sh $IPA $IPB
    wait
done