#!/usr/bin/bash

proxy_group="Direct   DIRECT Proxy  REJECT"
proxy_group[${#proxy_group[@]}]="Domestic DIRECT Proxy  REJECT"
proxy_group[${#proxy_group[@]}]="AdBlock  REJECT Proxy  DIRECT"
proxy_group[${#proxy_group[@]}]="Foreign  Proxy  DIRECT REJECT"
proxy_group[${#proxy_group[@]}]="Netflix  Proxy  DIRECT REJECT"
# proxy_group[${#proxy_group[@]}]="Driect  DIRECT Proxy REJECT"
# proxy_group[${#proxy_group[@]}]="Driect  DIRECT Proxy REJECT"



# 规则碎片-去广告	只包含常见广告关键字、广告联盟。无副作用，放心使用
# BanAD.list
name_group="AdBlock"
url_group="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list"
# 规则碎片-去广告	包含常用应用的各种去广告规则。可能有轻微副作用，可放心使用。（如果网站功能和广告冲突，会删掉去广告规则）
# BanProgramAD.list
name_group[${#name_group[@]}]="AdBlock"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list"
# 规则碎片-去广告	AdblockPlus中的中国所有的屏蔽域名
# BanEasyListChina.list
name_group[${#name_group[@]}]="AdBlock"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list"
# 规则碎片-直连	国内常见域名、直连CDN等。（很全，常用网址都有）
# ChinaDomain.list
name_group[${#name_group[@]}]="Domestic"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list"
# 规则碎片-直连	国内BAT公司及云服务厂商的IP段。所有在该云服务上的网站都可以直连。比如你网站在阿里云香港都可以直连。
# ChinaCompanyIp.
name_group[${#name_group[@]}]="Domestic"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaCompanyIp.list"
# 规则碎片-直连	IPIP的国内地址段。比GeoIp更好。电脑性能好，可以引入
# ChinaIp.list
name_group[${#name_group[@]}]="Domestic"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaIp.list"
# 中国媒体列表
# ChinaMedia.list
name_group[${#name_group[@]}]="Domestic"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaMedia.list"
# 规则碎片-直连	一些下载用的域名
# Download.list
name_group[${#name_group[@]}]="Domestic"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Download.list"
# 规则碎片	苹果公司的所有域名
# Apple.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Apple.list"
# 规则碎片	微软公司的所有域名
# Microsoft.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Microsoft.list"
# 规则碎片	OneDrive
# OneDrive.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/OneDrive.list"
# 媒体库 学术网站
# ProxyMedia.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyMedia.list"
# 规则碎片-直连	谷歌在中国能直连的网址列表
# GoogleCN.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/GoogleCN.list"
# 规则碎片-代理	Telegram的所有域名
# Telegram.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Telegram.list"
# 规则碎片-代理	Netflix的所有域名
# Netflix.list
name_group[${#name_group[@]}]="Netflix"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Netflix.list"
# 规则碎片-代理	GFW的全量列表
# ProxyGFWlist.list
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyGFWlist.list"
# 规则碎片-代理	比较精简的代理列表，包含常用的，以及被污染的域名
# ProxyLite.list	
name_group[${#name_group[@]}]="Foreign"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyLite.list"
# 规则碎片-直连	本地地址和路由器直连域名啥的
# LocalAreaNetwork.list
name_group[${#name_group[@]}]="Direct"
url_group[${#url_group[@]}]="https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/LocalAreaNetwork.list"





# append_group_name test.txt myname

append_group_name(){
    # $1 apped name[]
    # $2 download url[]
    # $3 save file
    name_group=$1
    url_group=$2
    save_file=$3

    # DOMAIN-SUFFIX：域名后缀匹配
    # DOMAIN：域名匹配
    # DOMAIN-KEYWORD：域名关键字匹配
    # IP-CIDR：IP段匹配, optional param "no-resolve" for IP rules (GEOIP IP-CIDR)
    # SRC-IP-CIDR：源IP段匹配
    # GEOIP：GEOIP数据库（国家代码）匹配
    # DST-PORT：目标端口匹配
    # SRC-PORT：源端口匹配
    # MATCH：全匹配（一般放在最后）

    echo "" >> $save_file
    echo "Rule:" >> $save_file

    for(( i=0;i<${#url_group[@]};i++))
    do
        url=${url_group[i]}
        name=${name_group[i]}
        echo "Add $name from $url"
        curl -L -s $url | sed "/DOMAIN/{s/$/,$name/;s/^/  -  /}" |\
            sed "/IP-CIDR/{s/$/,$name/;s/^/  -  /}" |\
            sed "/-PORT/{s/$/,$name/;s/^/  -  /}" |\
            sed "/GEOIP/{s/$/,$name/;s/^/  -  /}" |\
            sed "/MATCH/d" |\
            sed "/no-resolve/{s/,no-resolve//;s/$/,no-resolve/}" |\
            sed "/#/{s/^/  #/}" |\
            grep -E '#|DOMAIN|IP-CIDR|GEOIP|-PORT|MATCH' >> $save_file
        echo "" >> $save_file
        wait
    done

    echo "" >> $save_file

    echo "  -  DOMAIN-SUFFIX,ip6-localhost,Direct" >> $save_file
    echo "  -  DOMAIN-SUFFIX,ip6-loopback,Direct" >> $save_file
    echo "  -  DOMAIN-SUFFIX,local,Direct" >> $save_file
    echo "  -  DOMAIN-SUFFIX,localhost,Direct" >> $save_file
    echo "  -  IP-CIDR,10.0.0.0/8,Direct" >> $save_file
    echo "  -  IP-CIDR,100.64.0.0/10,Direct" >> $save_file
    echo "  #-  IP-CIDR,127.0.0.0/8,Direct" >> $save_file
    echo "  #-  IP-CIDR,172.16.0.0/12,Direct" >> $save_file
    echo "  -  IP-CIDR,192.168.0.0/16,Direct" >> $save_file
    echo "  -  IP-CIDR6,::1/128,Direct" >> $save_file
    echo "  -  IP-CIDR6,fc00::/7,Direct" >> $save_file
    echo "  -  IP-CIDR6,fe80::/10,Direct" >> $save_file
    echo "  -  IP-CIDR6,fd00::/8,Direct" >> $save_file

    echo "  -  GEOIP,CN,Domestic" >> $save_file
    echo "  -  MATCH,Proxy" >> $save_file

    echo "Append process is done."
}


generate_group(){
    # $1 group name
    # $2 - $n proxies
    # if no $2 will use default set
    # default is: DIERCT Proxy REJECT
    group=$1
    echo "  -  name: $group"
    echo "     type: select"
    echo "     proxies:"

    if [[ "$2" == "" ]] ; then
        # output default proxies
        echo "      - DIRECT"
        echo "      - Proxy"
        echo "      - REJECT"
        echo ""
    else
        # output all parameter
        for (( numP=2;numP<=$#;numP++ ))
        do
            eval para=\$$numP
            echo "      - $para"
        done
        echo ""
    fi

}

generate_all_group(){
    # $1 is save file
    save_file=$1
    echo "" >> $save_file
    echo "Proxy Group:" >> $save_file
    for(( list=0;list<${#proxy_group[@]};list++ )) 
    do
        generate_group ${proxy_group[list]} >> $save_file
    done 
}

download_all_link() {
    # $1 download url[]
    url_group=$1
    mkdir -p list
    cd list
    for(( i=0;i<${#url_group[@]};i++))
    do
        url=${url_group[i]}
        wget $url
    done
    cd ../
}


action=$1
save_file=$2

if [[ "$action" == "" ]] ; then
    echo "rule  | r   | R     : Only generate rule to file"
    echo "group | g   | G     ：Only generate group to file"
    echo "all   | All | a | A : generate rule and group to file"
    echo "down  | load| D | d : Download all list into ./list/*"
    echo "If don'e set file name, the default file name is: rules.yml"
fi

if [[ "$save_file" == "" ]] ; then
    save_file="rules.yml"
fi


case "$action" in
    rule | r | R )
        echo "Generate rules into $save_file"
        : > $save_file
        append_group_name $name_group $url_group $save_file
        ;;
    group | G | g )
        echo "Generate proxy groups into $save_file"
        : > $save_file
        generate_all_group $save_file
        ;;
    all | All | A | a)
        echo "Generate proxy groups and rules into $save_file"
        : > $save_file
        generate_all_group $save_file
        append_group_name $name_group $url_group $save_file
        ;;
    down | load | D | d )
        download_all_link $url_group
        ;;
    *)
        ;;
esac

