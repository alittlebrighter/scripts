#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.free.install
# -TAGS- = coach,free,install
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Generates coach protobuf models and then installs the binary.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
PROJECT=github.com/alittlebrighter/coach

go generate $PROJECT
go install $PROJECT/cmd/coach
