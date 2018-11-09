#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = gcloud.svcaccount.create
# -TAGS- = gcloud,service account
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Creates a new service account for Google Cloud.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
NAME=$1
PROJECT=$2

gcloud iam service-accounts create $NAME
gcloud projects add-iam-policy-binding $PROJECT --member "serviceAccount:${NAME}@${PROJECT}.iam.gserviceaccount.com" --role "roles/owner"

echo "$NAME service account created as owner for project $PROJECT.  You should go to Google Cloud Console and limit these permissions."
