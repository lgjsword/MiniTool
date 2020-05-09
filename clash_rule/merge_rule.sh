#/usr/bin/bash
# merge generated rule into complete conf yml
# depend special sign

#vvvvvv special sign
#


merge_one_file() {
    # $1 config file name
    # $2 rule file
    # output is stdout
    #vvvvvv special sign
    ####thespecialsign_DO_NOT_CHANGE_THIS###
    configFile=$1
    ruleFile=$2
    line=$(cat $configFile| dos2unix | sed -n '/^####thespecialsign_DO_NOT_CHANGE_THIS###$/=' | head -n 1)
    if [[ "$line" != "" ]] ; then
        cat $configFile | sed "$line,\$d"
        echo "####thespecialsign_DO_NOT_CHANGE_THIS###"
        cat $ruleFile
    fi
}





rule_file="rules.yml"
orig_file="self_clash_basic.yml"
out_file="self_clash_rule.yml"
# ./generate_rule.sh a $rule_file
merge_one_file $orig_file $rule_file > $out_file
merge_one_file "share_clash_basic.yml" $rule_file  > "share_clash_rule.yml"


