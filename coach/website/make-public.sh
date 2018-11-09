#!/usr/bin/env dash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.website.make-public
# -TAGS- = coach,website,acl,gsutil
#-SHELL- = dash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Make gcloud storage objects public for website.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
gsutil acl -r ch -u AllUsers:R gs://coach.alittlebrighter.io/*
