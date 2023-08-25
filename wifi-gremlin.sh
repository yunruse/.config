#!/bin/sh

# "Focus app" substitute, as my ADHD is chronic:
# no wi-fi after midnight. macOS only.

# (Hide the wifi icon from your menu bar!)
# I personally use a crontab entry of
# */5 23,0-11 * * * sh/.config/wifi-gremlin
# so if somehow I re-enable wifi I only get 5 minutes - 
# as opposed to macOS' "Downtime" which is very very easily disabled for the entire day.

h=$(date +%H)
if [ $h -ge 0 ] && [ $h -le 7 ]; then
    networksetup -setairportpower en0 off
else
    networksetup -setairportpower en0 on
fi
