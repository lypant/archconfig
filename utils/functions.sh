#!/bin/bash

# Run the script with parameter determining logging file
if [ $# -lt 1 ]; then
	LOG_FILE="error.log"
	echo "Functions script: Error: log path not provided" 2>&1 | tee -a $LOG_FILE
	return 1
else
	LOG_FILE=$1
fi

LOG_NOT_ENOUGH_PARAMS='executeCommand "echo $FUNCNAME: Not enough params \($#\): $@"'
EXECUTING_SCRIPT_MSG="Executing script"
EXECUTED_SCRIPT_MSG="Executed script"

executeCommand ()
{
   (eval "$@" 2>&1) | tee -a $LOG_FILE
   return ${PIPESTATUS[0]}
}

log ()
{
   local RESULT=""
   if [ $# -lt 1 ]; then
      eval $LOG_NOT_ENOUGH_PARAMS
      RESULT=1
   else
      executeCommand "echo $@"
      RESULT=$?
   fi
   return $RESULT
}

executeScript ()
{
   local RESULT=""
   if [ $# -lt 1 ]; then
      eval $LOG_NOT_ENOUGH_PARAMS
      RESULT=1
   else
      log "$EXECUTING_SCRIPT_MSG $1"
      executeCommand "source $@"
      RESULT=$?
      log "$EXECUTED_SCRIPT_MSG $1"
   fi
   return $RESULT
}

# $1 - statement checked for success
# $2 - number of retries, optional
repeatUntilSuccess ()
{
	local RETRIES=1
	local REPEAT=true
	local RESULT=0

	if [ $# -lt 2 ]; then
		eval $LOG_NOT_ENOUGH_PARAMS
		RESULT=1
	else
		while $REPEAT; do
			RETRIES=$((RETRIES+1))
			executeCommand $1
			RESULT="$?"
			if [ "$RESULT" -eq 0 ]; then
				REPEAT=false
			fi
			if [ -n "$2" ] && [ "$RETRIES" -gt "$2" ]; then
				RESULT=1
				REPEAT=false
			fi
		done
	fi
	return $RESULT
}

# Params contain message to be displayed
anyKey ()
{
	executeCommand "echo $@"
	executeCommand "read -sn 1 -p \"Any key to continue...\""
	executeCommand "echo"
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
			log "Overwriting file $OUT"
		else
			log "File $OUT exists. Use --overwrite flag to replace"
		fi

		if $DOWNLOAD; then
			eval "$CMD"
			RESULT=$?
			if [ "$RESULT" -gt 0 ]; then
				anyKey "Failed to download $URL to $OUT : error $RESULT"
			fi
		fi
	else
		#echo "Empty command!"
		log "Empty command!"
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

doCommentVar ()
{
	local VAR="$1"
	local FILE="$2"
	local BASE="sed"
	local CMD=""

	if [ -n "$3" ] && [ $3 == "sudo" ]; then
		CMD="sudo $BASE"
	else
		CMD="$BASE"
	fi

	executeCommand "$CMD -i \"s/^\(${VAR}.*\)$/#\1/\" \"${FILE}\""
	return $?
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
	local BASE="sed"
	local CMD=""

	if [ $# -gt 2 ]; then
		if [ $3 == "sudo" ]; then
			CMD="sudo $BASE"
		fi
	else
		CMD="$BASE"
	fi

	executeCommand "$CMD -i \"s/^#\(${VAR}.*\)$/\1/\" \"${FILE}\";"
}

uncommentVar ()
{
	doUncommentVar "$1" "$2"
}

uncommentVarSudo ()
{
	doUncommentVar "$1" "$2" "sudo"
}

return 0 

