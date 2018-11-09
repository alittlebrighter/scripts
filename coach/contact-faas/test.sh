#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.contact-faas.test
# -TAGS- = coach,website,google-faas,gcloud
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Deploys and tests a simple gcloud function that sends an email via MailGun
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
cd ~/workspace/coach-website/faas

gcloud beta functions deploy contactPOST --trigger-http

curl --header "Content-Type: application/json" 
	--request POST 
	--data '{"name":"Billy Bob","email":"test@example.com","message":"this is a test of google faas with mailgun"}' 
	https://us-central1-coach-website.cloudfunctions.net/contactPOST
