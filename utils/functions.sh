#!/bin/bash

anyKey ()
{
	echo -e "\n$@"
	read -sn 1 -p "Any key to continue..."
	echo
}

doDownloadFile ()
{
	if [ $# -lt 2 ]; then
		anyKey "Provide repository url and file name as parameters\nGiven params: $@"
		return 1
	fi

	local URL=$1
	local OUT=$2
	local OVERWRITE=$3

	# Last param
	local MOD="${@: -1}"
	local BASE="curl -o $OUT --create-dirs -fsL $URL"
	local CMD=""

	if [ -n "$MOD" -a $MOD == "sudo" ]; then
		CMD="sudo $BASE"
	else
		CMD="$BASE"
	fi

	local DOWNLOAD=false
	local RESULT=0

	if [ -n "$CMD" ]; then
		if [ ! -e "$OUT" ]; then
			DOWNLOAD=true
		elif [ "$OVERWRITE" == "--overwrite" ]; then
			DOWNLOAD=true
			echo "File $OUT exists but overwrite flag set"
		else
			echo "File $OUT exists. Use --overwrite flag to replace"
		fi

		if $DOWNLOAD; then
			eval "$CMD"
			RESULT=$?
			if [ "$RESULT" -gt 0 ]; then
				anyKey "Failed to download $URL to $OUT : error $RESULT"
			fi
		fi
	else
		echo "Empty command!"
	fi

	return $RESULT
}

downloadFile ()
{
	doDownloadFile $@
}

downloadFileSudo ()
{
	doDownloadFile $@ "sudo"
}

# $1 - statement checked for success
# $2 - number of retries, optional
repeatUntilSuccess ()
{
	local RETRIES=0
	local REPEAT=true

	while $REPEAT; do
		RETRIES=$((RETRIES+1))
		eval "$1"
		if [ "$?" -eq 0 ]; then
			REPEAT=false
		fi
		if [ -n "$2" -a "$RETRIES" -gt "$2" ]; then
			return 1
		fi
	done

	return 0
}

doCommentVar ()
{
	local VAR="$1"
	local FILE="$2"
	local MOD="$3"
	local BASE="sed"
	local CMD=""

	if [ -n "$MOD" -a $MOD == "sudo" ]; then
		CMD="sudo $BASE"
	else
		CMD="$BASE"
	fi

	$CMD -i "s/^\(${VAR}.*\)$/#\1/" "${FILE}"
}

commentVar ()
{
	doCommentVar "$1" "$2"
}

commentVarSudo ()
{
	doCommentVar "$1" "$2" "sudo"
}

doUncommentVar ()
{
	local VAR="$1"
	local FILE="$2"
	local MOD=""
	local BASE="sed"
	local CMD=""

	if [ $# -gt 2 ]; then
		MOD="$3"
	fi

	if [ $MOD == "sudo" ]; then
		CMD="sudo $BASE"
	else
		CMD="$BASE"
	fi

	$CMD -i "s/^#\(${VAR}.*\)$/\1/" "${FILE}";
}

uncommentVar ()
{
	doUncommentVar "$1" "$2"
}

uncommentVarSudo ()
{
	doUncommentVar "$1" "$2" "sudo"
}

