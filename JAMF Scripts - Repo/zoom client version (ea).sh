#!/bin/bash

zoom_parser=$(curl -s https://www.jamf.com/jamf-nation/third-party-products/432/zoom > zoom_version && cat zoom_version | grep "Current")
current_zoom_version=$(echo $zoom_parser | sed 's/.*://' | sed 's/.*<\/strong>//'| sed 's/<\/li>//')
version=$(defaults read /Applications/zoom.us.app/Contents/Info CFBundleShortVersionString 2>/dev/null)

if [[ ! $version ]]; then
	echo "<result>Not Installed</result>"
elif [[ (($version == $current_zoom_version)) ]]; then
	echo "<result>Latest ($version)</result>"
elif [[ (($version < $current_zoom_version)) ]]; then
	echo "<result>Old ($version)</result>"
else
	echo "<result>Latest ($version)</result>"
fi