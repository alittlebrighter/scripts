#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = gcloud.faas.deploy
# -TAGS- = gcloud,functions,faas,deploy
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Deploys a cloud function to gcloud.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
func=$1

if [ $func == "" ]; then
	printf "Function Name: "
	read func
fi

gcloud beta functions deploy $func --trigger-http
