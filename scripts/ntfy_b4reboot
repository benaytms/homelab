#!/bin/bash
export DISPLAY=:0.0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

/usr/bin/notify-send -u critical "Rebooting in 10." "System should be back in a bit!" ; \
/usr/bin/curl -s -d "System reboot in 10 minutes." https://ntfy.fdebris.online/dbn_alerts
