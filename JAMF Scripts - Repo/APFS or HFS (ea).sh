#!/bin/sh

echo "<result>$(diskutil info / | awk -F': ' '/File System/{print $NF}' | xargs)</result>"
