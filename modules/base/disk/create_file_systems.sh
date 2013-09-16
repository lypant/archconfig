#!/bin/bash

mkswap "/dev/$SWAP_PARTITION"
swapon "/dev/$SWAP_PARTITION"
"mkfs.$ROOT_FILE_SYSTEM" "/dev/$ROOT_PARTITION"

