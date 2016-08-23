#!/bin/bash 

serial=`ioreg -l | grep IOPlatformSerialNumber | awk '{print $4}' | 
cut -d \" -f 2` 
computername=M$serial 
scutil --set LocalHostName "$computername" 

scutil --set ComputerName "$computername" 

scutil --set HostName "$computername" 