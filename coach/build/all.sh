#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.build.all
# -TAGS- = coach,build,go
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Builds coach and coach-trader for all OSes.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
cd ~/workspace/coach-website/builds
mkdir -p {linux,linux-arm,windows,darwin}

PROJECT=github.com/alittlebrighter/coach-pro/cmd/

bin=coach
CGO_ENABLED=false GOOS=linux go build -o linux/$bin ${PROJECT}${bin}
CGO_ENABLED=false GOOS=linux GOARCH=arm go build -o linux-arm/$bin ${PROJECT}${bin}
CGO_ENABLED=false GOOS=darwin go build -o darwin/$bin ${PROJECT}${bin}
CGO_ENABLED=false GOOS=windows go build -o windows/$bin ${PROJECT}${bin}

bin=coach-trader
CGO_ENABLED=false GOOS=linux go build -o linux/${bin} ${PROJECT}${bin}
CGO_ENABLED=false GOOS=linux GOARCH=arm go build -o linux-arm/$bin ${PROJECT}${bin}
CGO_ENABLED=false GOOS=darwin go build -o  darwin/$bin ${PROJECT}${bin}
CGO_ENABLED=false GOOS=windows go build -o windows/$bin ${PROJECT}${bin}
