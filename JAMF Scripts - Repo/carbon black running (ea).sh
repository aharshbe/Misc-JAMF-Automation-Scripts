#!/bin/bash

val=$(ps auwwx | egrep "/(CbOsxSensorService)" | wc -l)


if [[ $val -eq 1 ]]; then
	echo "<result>True</result>"
else
	echo "<result>False</result>"
fi