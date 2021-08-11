#!/bin/bash

if [ "$1" == " " ]
then
echo "Usage: ztransferscanner.sh <domain>"
else
domain="$1"
name_servers=$(host -t ns $domain | cut -d " " -f 4 | sed 's/.$//')
for i in ${name_servers[@]}
do
dig axfr @"${i}" "$domain"
echo "${i}"
done
fi


