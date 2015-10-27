#!/bin/bash

BATTPERCENT=`cat /sys/class/power_supply/BAT1/capacity`
BATTSTATUS=`cat /sys/class/power_supply/BAT1/status`
BATTINFO=`acpi -b`

if [[ `echo $BATTSTATUS | grep Discharging` && `echo $BATTPERCENT` -lt 20 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send "low battery" "$BATTINFO"
fi
