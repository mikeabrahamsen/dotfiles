#!/bin/sh
# set the battery charging thresholds to extend battery lifespan
# uses default thresholds at 40% and 80%
# example commands:

# To set both battery thresholds to 40 and 80
# set_battery_thresholds 0 

# To set battery 2 thresholds to 40 and 80
# set_battery_thresholds 2

# To set both battery thresholds to 40 and 50
# set_battery_thresholds 0 40 50

sudo tpacpi-bat -s ST ${1:-0} ${2:-40}
sudo tpacpi-bat -s SP ${1:-0} ${3:-80}
