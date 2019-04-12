#!/bin/bash

zoom_parser=$(curl -s https://www.jamf.com/jamf-nation/third-party-products/432/zoom > zoom_version && cat zoom_version | grep "Current")
current_zoom_version=$(echo $zoom_parser | sed 's/.*://' | sed 's/.*<\/strong>//'| sed 's/<\/li>//')
version=$(defaults read /Applications/zoom.us.app/Contents/Info CFBundleShortVersionString 2>/dev/null)

if [ $version == $current_zoom_version ]
then
    echo  "Zoom is already installed and is the current version"
else
    test -f /Applications/zoom.us.app/Contents/Resources/ZPLogo.icns
    icon=$(echo $?)
    if [ $icon == 0 ];
	  then
	    install="$(
		    osascript -e '
		        set sicon to POSIX file "/Applications/zoom.us.app/Contents/Resources/ZPlogo.icns"
			    set sicon to sicon as alias
			        display dialog "There is an update for the Zoom client.\n\nUpdating will restart Zoom and cancel any calls." buttons {"Update now", "Later"} default button "Update now" with icon sicon'
    )"
else
    install="$(osascript -e 'display dialog "There is an update for the Zoom client.\n\nUpdating will restart Zoom now." buttons {"Update now", "Later"} default button "Update now"')"
fi
if [ "$install" = "button returned:Update now" ]; then
      cd $HOME/Applications
        pwd
	  curl -LO https://zoom.us/client/latest/Zoom.pkg
	    installer -pkg ./Zoom.pkg -target /
	      rm -rf Zoom.pkg
	        cd -
		else
        echo "Maybe next time."
	fi
fi