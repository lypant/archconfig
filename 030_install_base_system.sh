# Create file systems
echo Creating file systems
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2

# Mount the partitions
echo Mounting partitions
mount /dev/sda2 /mnt

# Select a mirror
echo Setting pacman mirrors - this can take a while
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.original
rankmirrors -n 5 /etc/pacman.d/mirrorlist.original > /etc/pacman.d/mirrorlist

# Install the base system
echo Installing base system
pacstrap -i /mnt base base-devel

# Generate fstab (-L is for labels, -U is for UIDs)
echo Generating fstab
genfstab -L -p /mnt >> /mnt/etc/fstab

# Clone repository again - it was wiped out during pacstrapping
echo Clonning the repo again
git clone https://github.com/lypant/archconfig /mnt/etc/archconfig

# Go to the local copy of repo
echo Entering the repo
cd /mnt/etc/archconfig

# Add branches which we are interested in
echo Setting branch tracking
git branch --track dwm_early origin/dwm_early

# Checkout the branch we are interested in
echo Checking out the repo
git checkout dwm_early

echo DONE
echo Continue with next instructions

