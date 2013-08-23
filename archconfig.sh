#!/bin/bash

REPOSITORY="https://raw.github.com/lypant/archconfig/experiments"

# First download script containing helper functions
curl -o "functions.sh" -fsL "$REPOSITORY/functions.sh"

# Load that script
source functions.sh

# Load other scripts
#downloadFile "$REPOSITORY/some_script.sh" "some_script.sh"
downloadFile "$REPOSITORY/task_one.sh" "task_one.sh"
downloadFile "$REPOSITORY/task_two.sh" "task_two.sh"

# Start executing scripts
source task_one.sh

