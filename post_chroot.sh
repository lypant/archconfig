#!/bin/bash

echo "STARTING $0"

echo Unmounting partitions
umount /mnt

# Add regular user
echo Adding regular user
useradd -m -g users -G wheel,storage,power -s /bin/bash adam

# Set password
echo Setting password for regular user
#passwd adam
repeatUntilSuccess "passwd adam" 3 || echo -e "\nERROR: password unchanged\n"

echo Adding user to sudoers
# TODO - do it in a safer way... Here just for experiments
echo "adam ALL=(ALL) ALL" >> /etc/sudoers

echo "ENDING $0"

