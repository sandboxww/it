#!/bin/sh

/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" DaysBetweenNotifications "15" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" ClientIdentifier "dsm-base" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" SoftwareRepoURL "http://dsm-mac-deploy.sandboxww.com/munki_repo" 

exit 0
