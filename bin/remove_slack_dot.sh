#!/usr/bin/env sh

# asar installed globally through npm: npm install -g asar

set -eu

# Clean up previous failed attempts
rm -rf ~/tmp/slack
rm -rf ~/tmp/app.asar

# Unpack
mkdir -p ~/tmp/slack
asar extract /usr/lib/slack/resources/app.asar ~/tmp/slack

# Modify
sed -i 's/unreads>0/false/g' ~/tmp/slack/dist/*.js

# Replace
sudo rm /usr/lib/slack/resources/app.asar
sudo rm -rf /usr/lib/slack/resources/app.asar.unpacked
asar pack ~/tmp/slack ~/tmp/app.asar
sudo cp ~/tmp/app.asar /usr/lib/slack/resources/app.asar
sudo cp -r ~/tmp/slack /usr/lib/slack/resources/app.asar.unpacked

echo "Enjoy your productivity"
