#!/bin/bash

# This script displays a message that lets the user know that
# enrollment has finished. It is set
# to the lowest priority to ensure that it runs last after all
# other scripts and policy actions.

open /System/Library/PreferencePanes/Profiles.prefPane
sleep 3

# Determine OS version
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

dialog="Your Mac has now been enrolled in GitHub's jamf Mobile Device Management solution. In the Profiles window, please click Approve on the User Profile named MDM Profile to continue. Thank you!
-GitHub IT"
description=`echo "$dialog"`
button1="OK"
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns"

if [[ ${osvers} -lt 7 ]]; then

  "$jamfHelper" -windowType utility -description "$description" -button1 "$button1" -icon "$icon"

fi

if [[ ${osvers} -ge 7 ]]; then

  jamf displayMessage -message "$dialog"

fi

exit 0