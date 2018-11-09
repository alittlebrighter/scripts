#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.build.authPlugin
# -TAGS- = plugin,coach
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Builds a Go plugin and sticks it in the coach authentication plugins directory
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
printf "Plugin name: "
read plugin

set -o xtrace

go build -o /usr/local/coach/plugins/authentication/${plugin}.so -buildmode=plugin github.com/alittlebrighter/coach-plugins/authentication/${plugin}
