# Add regular user
echo Adding regular user adam
useradd -m -g users -G wheel,storage,power -s /bin/bash adam

# Set password
# TODO Use script parameter for getting the name
echo Setting password for adam
passwd adam

# Add user to sudoers
echo Adding user to sudoers... forgive me for I have sinned...
#visudo
#adam ALL=(ALL) ALL
echo 'adam ALL=(ALL) ALL' >> /etc/sudoers

# Shut down to do VBox snapshot and log as a regular user
#shutdown -h 0
echo User added to sudoers
echo DONE
echo Reboot and log in as a regular user. Continue with next instructions.
 
