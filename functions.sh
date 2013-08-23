#!/bin/bash

anyKey ()
{
	echo -e "\n$@"
	read -sn 1 -p "Any key to continue..."
	echo
}

downloadFile ()
{
	if [ $# -lt 2 ]; then
		anyKey "Provide repository url and file name as parameters\nGiven params: $@"
		return 1
	fi

	local URL=$1
	local OUT=$2
	local CMD="curl -o $OUT -fsL $URL"

	[ -n "$CMD" ] && eval "$CMD"
	local RESULT=$?

	if [ "$RESULT" -gt 0 ]; then
		anyKey "Failed to download $URL to $OUT : error $RESULT"
	fi

	return $RESULT
}

