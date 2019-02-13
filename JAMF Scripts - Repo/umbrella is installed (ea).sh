#!/bin/bash

val=$(ls /Applications/OpenDNS\ Roaming\ Client 2>null | grep "RoamingClientMenubar.app")
if [[ $val ]]; then
    echo "<result>True</result>"
else
    echo "<result>False</result>"
fi