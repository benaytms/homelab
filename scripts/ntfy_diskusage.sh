#!/bin/bash
USAGE="$( df -H /home --output=size,used,avail,pcent )"
export DISPLAY=:0.0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

/usr/bin/notify-send -u normal "Disk Usage" "$USAGE" ; \
/usr/bin/curl -s -d "$USAGE" https://ntfy.fdebris.online/dbn_alerts
