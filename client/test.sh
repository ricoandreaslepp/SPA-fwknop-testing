#!/bin/bash

# should result in filtered
/usr/bin/nmap -p80 spa-server
# send the SPA packet
fwknop -n spa-server --rc-file /client/.fwknoprc
# should show open/closed
/usr/bin/nmap -p80 spa-server
