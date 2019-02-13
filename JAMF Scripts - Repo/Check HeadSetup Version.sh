#!/bin/bash

var=$(defaults read /Applications/HeadSetup.app/Contents/Info CFBundleShortVersionString)

safe_ver="5.3.7011"

if [[ (($var < $safe_ver)) ]]; then
	echo "not safe"
elif [[ (($var == $safe_ver)) ]]; then
	echo "safe"
else
	"safe"
fi
