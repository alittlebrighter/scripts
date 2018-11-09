#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = coach.push
# -TAGS- = coach.push
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Tests and tries to install coach-pro before pushing to remote.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
#
# Tests and tries to install coach-pro before pushing to remote.
#
PROJECT=github.com/alittlebrighter/coach-pro

go test $PROJECT
if [ "$?" != 0 ]; then
    exit $?
fi

go install $PROJECT/cmd/coach
if [ "$?" != 0 ]; then
	exit $?
fi

(cd $GOPATH/src/$PROJECT; git push)
