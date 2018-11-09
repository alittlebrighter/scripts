#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = git.delete.branch
# -TAGS- = git,branch,delete
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Deletes a branch both locally and on the remote repository.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
printf "Branch to DELETE: "
read BRANCH

git branch -D $BRANCH

printf "Delete '$BRANCH' from remote repository? [Y/n] "
read deleteRemote

if [ $deleteRemote == "y" ]; then
	git push --delete origin $BRANCH
fi
