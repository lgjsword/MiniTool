#!/bin/bash
#remove # line
file=$1
# split ip sign
# , - ~
# remote # line; filter [~, -]; replace [~ -] to ,
for field in $(sed '/#/d' $file | sed -n '/[~, -]/p' | sed 's/[~ -]/,/g' | dos2unix) 
do
    IPA=$(echo $field | gawk -F "[,]" '{print $1}')
    IPB=$(echo $field | gawk -F "[,]" '{print $2}')
    ./ip_range.sh $IPA $IPB
    # echo $field
    # echo $IPA
    # echo $IPB
    wait
done