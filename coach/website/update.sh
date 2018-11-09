#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.website.update
# -TAGS- = Pushes
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Pushes contents of coach-website/public to Google Cloud Storage hosting for use as the website.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
cd /home/adam/workspace/coach-website/public

gsutil cp -r ./* gs://coach.alittlebrighter.io/
gsutil acl -r ch -u AllUsers:R gs://coach.alittlebrighter.io/*
