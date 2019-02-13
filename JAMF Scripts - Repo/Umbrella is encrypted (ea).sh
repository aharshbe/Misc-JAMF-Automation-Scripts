#!/bin/bash

dig debug.opendns.com txt +tries=1 +short |grep "dnscrypt enabled"
if [[ $? -ne 0 ]]
then
	echo "<result>False</result>"
else
	echo "<result>True</result>"
fi