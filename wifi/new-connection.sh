#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = wifi.new-connection
# -TAGS- = wifi,nmcli,internet,connect
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Uses nmcli to show available networks and then connect.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
nmcli device wifi rescan
nmcli device wifi list

printf "SSID you would like to connect to: "
read ssid

stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"

if [ -n $PASSWORD ]; then
	PASSWORD="password $PASSWORD"
fi

nmcli device wifi connect "$ssid" $PASSWORD
