#!/bin/bash

## Forces logout in order to enable FileVault

touch ~/Library/Containers/io.fti.SplashBuddy/Data/Library/.SplashBuddyDone

echo "Unloading and removing Splashbuddy LaunchDaemon"
launchctl unload /Library/LaunchDaemons/io.fti.splashbuddy.launch.plist
rm -f /Library/LaunchDaemons/io.fti.splashbuddy.launch.plist

echo "Please log out to configure FileVault"
osascript -e 'ignoring application responses' -e 'tell application "loginwindow" to «event aevtrlgo»' -e end
