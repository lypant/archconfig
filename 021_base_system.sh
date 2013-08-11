# Create file systems
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2

# Mount the partitions
mount /dev/sda2 /mnt

# Select a mirror
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.original
rankmirrors -n 5 /etc/pacman.d/mirrorlist.original > /etc/pacman.d/mirrorlist

# Install the base system
pacstrap -i /mnt base base-devel

# Generate fstab (-L is for labels, -U is for UIDs)
genfstab -L -p /mnt >> /mnt/etc/fstab

