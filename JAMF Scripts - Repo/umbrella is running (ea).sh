#!/bin/bash

if [[ 3 -eq $(ps auwwx | egrep "/(dnscrypt|RoamingClientMenubar|dns-updater)" | grep -v egrep | wc -l) ]]; then
    val=0;
else
    val=1;
fi

if [[ $val == '0' ]]; then
    echo "Umbrella is running.";
    dig debug.opendns.com txt +time=2 +tries=1 +short | sed 's/^"/  "/' | grep '"';
    [[ 1 == $? ]] && echo "Umbrella is not functioning correctly!" && echo "<result>False</result>";
    echo "<result>True</result>"
else
    stop &>/dev/null
    echo "Umbrella is stopped";
    echo "<result>False</result>"
    exit 0;
fi

exit 0;