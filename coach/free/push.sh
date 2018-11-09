#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.free.push
# -TAGS- = push,coach,free,git
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Runs tests and tries to install before pushing to Github.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
PROJECT=github.com/alittlebrighter/coach

go test $PROJECT
if [ "$?" != 0 ]; then
    exit $?
fi

go install $PROJECT/cmd/coach
if [ "$?" != 0 ]; then
	exit $?
fi

(cd $GOPATH/src/$PROJECT; git push)
