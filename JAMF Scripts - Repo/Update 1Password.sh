#!/bin/bash

onepassword_parser=$(curl -s https://www.jamf.com/jamf-nation/third-party-products/388/1password > onepassword_version && cat onepassword_version | grep "Current")
current_onepassword_version=$(echo $onepassword_parser | sed 's/.*<\/strong>//'| sed 's/<\/li>//' | sed 's/\s.*$//' | sed 's/(.*//')
version=$(defaults read /Applications/1Password\ 7.app/Contents/Info CFBundleShortVersionString 2>/dev/null)


name="1Password-$(echo $current_onepassword_version | sed 's/ //g').pkg"

if [ $version == $current_onepassword_version ]
then
    echo  "1Password is already installed and is the current version"
else
  	cd $HOME/Applications
	curl -so ./1password.pkg https://c.1password.com/dist/1P/mac7/$name
	sudo installer -pkg ./1password.pkg -target /
	rm -rf 1password.pkg
	cd -
fi