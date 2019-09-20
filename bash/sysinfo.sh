#!/bin/bash
# This script will email us our user, IP, hostname and today's date
emailaddress=blairtl@mail.uc.edu
today="$printf Today is: \t $(date +"%d-%m-%Y")
 "
ip="$printf My IP is: \t $(ip a | grep 'dynamic ens192' | awk '{print $2}')
 "
content="$printf Name: \t $USER
 "
bash="$printf My BASH version is: \t $BASH_VERSION
 "
mail -s "IT3038C Linux IP" $emailaddress <<< $(echo -e "$content" "$today" "$ip" "$bash")
