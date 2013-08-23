#!/bin/bash

# Params required by the script:
#	$HDD
#	$SWAP_SIZE
#	$ROOT_SIZE

#echo -e $HDD
#echo -e $SWAP_SIZE
#echo -e $ROOT_SIZE

cat << EOF | fdisk $HDD
n
p
1

$SWAP_SIZE
t
82
n
p
2

$ROOT_SIZE
t
2
83
a
2
w
EOF

