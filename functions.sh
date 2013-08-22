#!/bin/bash

# Helper functions - taken from or based on archblocks approach

anyKey ()
{
	# Print parameters in new line and wait for user input
	echo -e "\n$@";
	read -sn 1 -p "Any key to continue...";
	echo;
}

executeScript ()
{
	# Do nothing when no parameter is provided
	[ -z "$@" ] && return

	# Process all parameters
	for script in $@; do
		isUrl=false isPath=false isRootPath=false;
		# Determine the case
		case "$script" in
			*://*) isUrl=true;;
			/*)    isRootPath=true;;
			*/*)   isPath=true;;	
		esac
		file="${script/%.sh/}.sh";
		if $isUrl; then
			url="${file}";
		elif [ -f "${DIR/%\//}/${file}" ]; then
			url="file://${file}";
		else
			url="${REPOSITORY/%\//}/${file}";
		fi

		# Load the script
		loadedScript="$(curl -fsL ${url})";
		
		# Execute the script
		[ -n "$loadedScript" ] && eval "${loadedScript}";

		# Check for errors
		if [ "$?" -gt 0 ]; then
			# Display warning
			anyKey "Execution of script \"$script\" experienced errors"
		fi
	done
}

