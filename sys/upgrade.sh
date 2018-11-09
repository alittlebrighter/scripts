#!/usr/bin/env bash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = sys.upgrade
# -TAGS- = system,upgrade,ubuntu
#-SHELL- = bash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Updates repositories and upgrades installed packages.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
#
# Updates repositories and upgrades installed packages.
#
sudo apt-get update && sudo apt-get upgrade
