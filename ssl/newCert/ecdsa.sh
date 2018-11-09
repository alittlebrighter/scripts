#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = ssl.newCert.ecdsa
# -TAGS- = ssl,newCert,ecdsa,coach
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# creates a new ecdsa cert
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
rm -rf /usr/local/coach/security/*

openssl ecparam -name sect571r1 -genkey -noout -out /usr/local/coach/security/coach_key.pem 
openssl req -new -x509 -key /usr/local/coach/security/coach_key.pem -out /usr/local/coach/security/coach.pem -days 3650
