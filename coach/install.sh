#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.install
# -TAGS- = coach,pro,install
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Generates models and installs Coach Pro.
#       second line
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
REPO=github.com/alittlebrighter/coach
go generate ${REPO}

if [ -z $1 ]; then
	printf "Project to build: "
    read project
else 
    project=$1
fi

if [ $project == "coach-grpc-web" ]; then 
	(cd $GOPATH/src/${REPO}/cmd/coach-grpc-web/web/coach-ui; npm run build)
    (cd $GOPATH/src/${REPO}/cmd/coach-grpc-web; packr install ${REPO}/cmd/coach-grpc-web)
else
	go install ${REPO}/cmd/${project}
fi
