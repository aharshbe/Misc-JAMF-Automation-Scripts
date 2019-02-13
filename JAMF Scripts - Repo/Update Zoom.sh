#!/bin/bash

zoom_parser=$(curl -s https://www.jamf.com/jamf-nation/third-party-products/432/zoom > zoom_version && cat zoom_version | grep "Current")
current_zoom_version=$(echo $zoom_parser | sed 's/.*://' | sed 's/.*<\/strong>//'| sed 's/<\/li>//')
version=$(defaults read /Applications/zoom.us.app/Contents/Info CFBundleShortVersionString 2>/dev/null)

if [ $version == $current_zoom_version ]
then
    echo  "Zoom is already installed and is the current version"
else
  	cd $HOME/Applications
	curl -so ./zoom.pkg https://d11yldzmag5yn.cloudfront.net/prod/$current_zoom_version/Zoom.pkg
	installer -pkg ./zoom.pkg -target /
	rm -rf zoom.pkg
	cd -
fi
