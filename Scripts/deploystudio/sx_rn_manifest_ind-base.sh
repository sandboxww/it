#!/bin/sh

/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" DaysBetweenNotifications "15" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" ClientIdentifier "IND-Base" 
/usr/bin/defaults write "/Library/Preferences/ManagedInstalls" SoftwareRepoURL "http://mci-mac-deploy.sandboxww.com/munki_repo"

exit 0
