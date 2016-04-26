#!/bin/bash
echo "----------------------------"
Per=$(curl -s -k -u username:password https://xx.xx.xx.xx/nitro/v1/stat/lbvserver |tr -s "," "\n" |sed 's|"||g'|sed 's|{||g'| sed 's|[[:blank:]]||g' |egrep -i "name|vslbhealth" |grep -A1 -i $1 |tail -1|cut -d: -f2)

echo -e "\033[32mName:\033[0m $1 "
echo -e "\033[32mvserver health:\033[0m $Per%"

echo "----------------------------"
echo -e "\t\033[36m-:vserver details:-\033[0m"
echo ""
curl -s -k -u username:password https://xx.xx.xx.xx/nitro/v1/config/lbvserver_servicegroupmember_binding/$1 |tr -s "," "\n" |sed 's|"||g'|sed 's|{||g'| sed 's|[[:blank:]]||g'|egrep -i "^port|^curstate|^ipv46"

echo "----------------------------"
