#!/bin/sh

/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" DaysBetweenNotifications "15" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" ClientIdentifier "yyz-base" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" SoftwareRepoURL "http://s-macdeploy-yyz.sandboxww.com/munki_repo" 

exit 0
