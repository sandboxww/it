#!/bin/sh

/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" DaysBetweenNotifications "15" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" ClientIdentifier "UC" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" SoftwareRepoURL "http://ucmacsvr01.sandboxww.com/munki_repo" 

exit 0
