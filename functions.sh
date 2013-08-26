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
	local CMD="curl -o $OUT --create-dirs -fsL $URL"
	local RESULT=0

	if [ -n "$CMD" ] && [ ! -e "$OUT" ]; then
		eval "$CMD"
		RESULT=$?
		if [ "$RESULT" -gt 0 ]; then
			anyKey "Failed to download $URL to $OUT : error $RESULT"
		fi
	else
		echo "File $OUT already exists, skipping"
	fi

	return $RESULT
}

