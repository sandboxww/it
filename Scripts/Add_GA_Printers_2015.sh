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
rm -R /Library/Printers
rm /Library/Preferences/org.cups.printers.plist

#Add all users to Print Management
dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin

#Add GA Printers
lpadmin -E -p "27CreativeBW" -v "lpd://27-creative-color.goble/black" -D "27 Creative BW" -L "Chicago - 27th Floor Production Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C7200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=True  -o EFColorMode=Grayscale
lpadmin -E -p "27CreativeColor" -v "lpd://27-creative-color.goble/print" -D "27 Creative Color" -L "Chicago - 27th Floor Production Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C7200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=True
lpadmin -E -p "27CreativeHold" -v "lpd://27-creative-color.goble/hold" -D "27 Creative Hold" -L "Chicago - 27th Floor Production Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C7200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=True
lpadmin -E -p "32MailBW" -v "lpd://32-mail-bw.goble/black" -D "32 Mail BW" -L "Chicago - 32nd Floor Mail Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C7200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=True -o EFColorMode=Grayscale
lpadmin -E -p "32MailColor" -v "lpd://32-mail-color.goble/print" -D "32 Mail Color" -L "Chicago - 32nd Floor Mail Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C7200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=True
lpadmin -E -p "32MailHold" -v "lpd://32-mail-color.goble/hold" -D "32 Mail Hold" -L "Chicago - 32nd Floor Mail Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C7200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=True
lpadmin -E -p "LAXBW" -v "lpd://la-bw.goble/black" -D "LAX BW" -L "Los Angeles Office" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C5200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=Option1 -o EFColorMode=Grayscale
lpadmin -E -p "LAXColor" -v "lpd://la-color.goble/print" -D "LAX Color" -L "Los Angeles Office" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C5200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=Option1
lpadmin -E -p "LAXHold" -v "lpd://la-color.goble/hold" -D "LAX Hold" -L "Los Angeles Office" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C5200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=Option1
lpadmin -E -p "27LargeFormat" -v "lpd://27-production-largeformat.goble/Canon_iPF8400S" -D "Large Format" -L "Chicago - 27th Floor Production Room" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon_iPF8400S Onyx PosterShop 11.ppd" -o printer-is-shared=false -E
lpadmin -E -p "32AccountingBW" -v "lpd://32-accounting-bw.goble" -D "32 Accounting BW" -L "Chicago - Accounting" -P "/Library/Printers/PPDs/Contents/Resources/CNPZUIRA4245ZU.ppd.gz" -o printer-is-shared=false -o CNDuplex=False -o CNSrcOption=OptCas2 -o CNFinisher=IFIND1 -E
lpadmin -E -p "6BW" -v "lpd://6-bw.goble/black" -D "6th Floor BW" -L "Chicago - 6th Floor" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C5200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=Option1 -o EFColorMode=Grayscale
lpadmin -E -p "6Color" -v "lpd://6-color.goble/print" -D "6th Floor Color" -L "Chicago - 6th Floor" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C5200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=Option1
lpadmin -E -p "6Hold" -v "lpd://6-color.goble/hold" -D "6th Floor Hold" -L "Chicago - 6th Floor" -P "/Library/Printers/PPDs/Contents/Resources/en.lproj/Canon iR-ADV C5200s GX400V1.0US" -o printer-is-shared=false -E -o EFFinisher=Finisher2 -o EFPaperDeckOpt=Option1



exit 0