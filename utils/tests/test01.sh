#!/bin/bash

source "../../settings.conf"
source ../functions.sh output.log

#executeCommand
#executeCommand pwd
#executeCommand rm non_existing_file

#sth pwd
#sth "rm blablabla"
#sth "rm skasuj.to"

#anyKey
#anyKey Raz dwa trzy
#anyKey "Paused"

#downloadFile "https://raw.github.com/lypant/archconfig/modular/get.sh" "get.sh"
#downloadFile "https://raw.github.com/lypant/archconfig/modular/get.sh" "get.sh" "--overwrite"
#downloadFile "https://raw.github.com/lypant/archconfig/modular/nonexisting.file" "void"


#commentVar "X" "settings.fake"
#commentVarSudo "X" "settings.fake"
#echo "Result of commentX: $?"

#uncommentVar "X" "settings.fake"
#uncommentVarSudo "X" "settings.fake"
#echo "Result of uncommentX: $?"

#source "../download.sh" "./skasuj"
executeScript "../download.sh" "./skasuj"

