#!/bin/sh
# get the battery charging thresholds
# example commands:

# get_battery_thresholds 1
# get_battery_thresholds 2

sudo tpacpi-bat -g ST ${1:-2}
sudo tpacpi-bat -g SP ${1:-2}
