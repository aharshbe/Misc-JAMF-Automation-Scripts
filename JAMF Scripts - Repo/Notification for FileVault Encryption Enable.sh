#!/bin/bash   

curl -o /tmp/octocat.png -k https://assets-cdn.github.com/images/modules/logos_page/Octocat.png 2>/dev/null

description="Hey there!

tldr; Please log out and log back into your machine in order to enable FileVault.

Details:

You are one of the lucky few that has not yet enabled FileVault on your machine. We have a favor to ask: When you have a sec, please log out of your computer and log back in. You should be prompted for your password in order to finalize enabling FileVault just before your computer completes the logout process -- this is totally normal. Once you log back into your computer, you should be good to go.

FYI:

This is not a phishing attack, we promise ;) For questions reach out to IT via Slack."
button="Cool!"

dir="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
window=" -windowType utility -title GitHub IT -icon /tmp/octocat.png"
"$dir" $window -description "$description" -button1 $button

rm -rf /tmp/octocat.png