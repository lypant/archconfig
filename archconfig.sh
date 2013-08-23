#!/bin/bash

REPOSITORY="https://raw.github.com/lypant/archconfig/experiments"

curl -o "functions.sh" -fsL "$REPOSITORY/functions.sh"

source functions.sh

downloadFile "$REPOSITORY/some_script.sh" "some_script.sh"

