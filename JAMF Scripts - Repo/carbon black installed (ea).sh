#!/bin/bash

if [[ -f "/Applications/CarbonBlack/CbOsxSensorService" ]]; then
    echo "<result>True</result>"
else
    echo "<result>False</result>"
fi