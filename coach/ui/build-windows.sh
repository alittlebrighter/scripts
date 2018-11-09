#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.ui.build-windows
# -TAGS- = coach,UI,build-windows
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# builds coach web UI for windows
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
REPO=github.com/alittlebrighter/coach-pro/cmd
home=$PWD

cd ${GOPATH}/src/${REPO}/coach-grpc-web/web/coach-ui; npm run build
cd $PWD
GOOS=windows packr build -o coach-grpc-web.exe ${REPO}/coach-grpc-web

GOOS=windows go build -o coach-grpc-server.exe ${REPO}/coach-grpc-server

zipfile=coach-ui-windows.zip
zip $zipfile ./*.exe
gsutil cp $zipfile gs://coach-builds/

rm $zipfile
rm ./*.exe
