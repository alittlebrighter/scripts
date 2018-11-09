#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.faas.downloadGateway.deploy
# -TAGS- = faas,deploy,downloadGateway,coach
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Build and copy downloadGateway to support.alittlebrighter.io
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
go install github.com/alittlebrighter/downloadGateway
scp $GOBIN/downloadGateway dev.alittlebrighter.io:/home/adam/

ssh -t dev.alittlebrighter.io 'sudo systemctl stop download-gateway; \
sudo cp /home/adam/downloadGateway /home/worker/web/; \
sudo systemctl start download-gateway'
