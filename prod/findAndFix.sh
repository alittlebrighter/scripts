#!/usr/bin/env dash

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = prod.findAndFix
# -TAGS- = prod,services,restart
#-SHELL- = dash
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Finds any services logging errors and restarts them.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
journalctl --since today | grep error | svcName=$(jq .service.name); systemctl restart $svcName
