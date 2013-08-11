# Add regular user
echo Adding regular user adam
useradd -m -g users -G wheel,storage,power -s /bin/bash adam

# Set password
echo Setting password for adam
passwd adam

# Add user to sudoers
visudo
#adam ALL=(ALL) ALL

# Shut down to do VBox snapshot and log as a regular user
#shutdown -h 0
echo User added to sudoers
echo DONE
echo Reboot and log in as a regular user. Continue with next instructions.
 
