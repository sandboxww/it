#!/bin/bash

#This script will reset printing system

#Stop CUPS
launchctl stop org.cups.cupsd

#Backup Installed Printers Property List
if [ -e "/Library/Printers/InstalledPrinters.plist" ]
    then
    mv /Library/Printers/InstalledPrinters.plist /Library/Printers/InstalledPrinters.plist.bak
fi

#Backup the CUPS config file
if [ -e "/etc/cups/cupsd.conf" ]
    then
    mv /etc/cups/cupsd.conf /etc/cups/cupsd.conf.bak
fi

#Restore the default config by copying it
if [ ! -e "/etc/cups/cupsd.conf" ]
    then
    cp /etc/cups/cupsd.conf.default /etc/cups/cupsd.conf
fi

#Backup the printers config file
if [ -e "/etc/cups/printers.conf" ]
    then
    mv /etc/cups/printers.conf /etc/cups/printers.conf.bak
fi

#Delete CUPS PPDs
rm -R /private/etc/cups/ppd

#Start CUPS
launchctl start org.cups.cupsd

#Remove all printers
lpstat -p | cut -d' ' -f2 | xargs -I{} lpadmin -x {}
rm /Library/Preferences/org.cups.printers.plist

#Add all users to Print Management
dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin

#Add MCI Printers
lpadmin -E -p "MCIKyocera4551" -v "lpd://10.1.8.45/MCI-CS4551Color" -D "MCI-Kyocera4551" -L "MCI - 920 Main St KCMO" -P "/Library/Printers/PPDs/Contents/Resources/Kyocera CS 4551ci.PPD" -o printer-is-shared=false -E -o HardDisk=True
lpadmin -E -p "MCIXerox7760GX" -v "lpd://10.1.8.45/MCI-Xerox7760-Creative2" -D "MCI-Xerox7760GX C2" -L "MCI - 920 Main St KCMO" -P "/Library/Printers/PPDs/Contents/Resources/Xerox Phaser 7760GX.gz" -o printer-is-shared=false -E
lpadmin -E -p "MCIXerox7800DX" -v "lpd://10.1.8.45/MCI-Xerox7800-Creative1" -D "MCI-Xerox7800DX C1" -L "MCI - 920 Main St KCMO" -P "/Library/Printers/PPDs/Contents/Resources/Xerox Phaser 7800DX.gz" -o printer-is-shared=false -E
lpadmin -E -p "MCIXeroxPhaser8560DN" -v "lpd://10.1.8.45/MCI-Xerox8560-EXEC" -D "MCI-Xerox8560DN Exec" -L "MCI - 920 Main St KCMO" -P "/Library/Printers/PPDs/Contents/Resources/Xerox Phaser 8560DN.gz" -o printer-is-shared=false -E

exit 0