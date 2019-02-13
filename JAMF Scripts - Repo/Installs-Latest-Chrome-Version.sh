#!/bin/bash

# Installs Google Chrome if not currently installed

if [ -e /Applications/Google\ Chrome.app ]
then
	echo "Google Chrome is already installed"
else
  cd /
  curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

  if [ -e googlechrome.dmg]
  then
      open /googlechrome.dmg
      cp -R /Volumes/Google\ Chrome/Google\ Chrome.app ./Applications
      /usr/bin/hdiutil detach /Volumes/Google\ Chrome
      rm googlechrome.dmg
      

		# Grants USER permissions to edit and update the Chrome application

		sudo chown -R $USER:admin /Applications/Google\ Chrome.app
		sudo chmod +rwx /Applications/Google\ Chrome.app
		echo "Chrome has been updated for ${USER}"
      
      
      echo "Success : Google Chrome Installed"
  else
      echo "Failed : Google Chrome Was Not Installed"

  fi
fi