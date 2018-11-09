#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.ui.install
# -TAGS- = coach,ui,install
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# builds coach web UI components
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
REPO=github.com/alittlebrighter/coach-pro/cmd

cd ${GOPATH}/src/${REPO}/coach-grpc-web/web/coach-ui; npm run build
(cd ${GOPATH}/src/${REPO}/coach-grpc-web; packr install ${REPO}/coach-grpc-web)

go install ${REPO}/coach-grpc-server
