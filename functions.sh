#!/bin/bash

anyKey ()
{
	echo -e "\n$@"
	read -sn 1 -p "Any key to continue..."
	echo
}

downloadFile ()
{
	local URL=$1
	local OUT=$2
	local CMD="curl -o $OUT -fsL $URL"

	[ -n "$CMD" ] && eval "$CMD"
	local RESULT=$?

	if [ "$RESULT" -gt 0 ]; then
		#echo "Error" $RESULT
		anykey "Failed to download $URL to $OUT : error $RESULT"
	fi
}

