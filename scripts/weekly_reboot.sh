#!/bin/bash
export DISPLAY=:0.0

/usr/bin/notify-send -u critical "System rebooting..." && \
sleep 5 && \
sudo /sbin/reboot
