#!/bin/bash

# Helper functions - taken fron or based on archblocks approach

executeScript ()
{
	# Do nothing when no parameter is provided
	[ -z "$@" ] && return

	echo There is some param

	for script in $@; do
		echo Script: $script
	done
}

