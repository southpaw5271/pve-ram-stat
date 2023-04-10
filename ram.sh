#!/bin/bash

# Get the total system RAM
total_ram=$(free -m | awk 'NR==2{print $2}')

# Get the RAM used by ZFS cache
zfs_ram=$(arcstat -fc -p | awk 'NR==2{print $1}')
zfs_ram=$((zfs_ram / 1024000))

# Calculate the RAM being used by subtracting ZFS cache from the total RAM
used_ram=$(free -m | awk 'NR==2{print $3}')

used_ram=$((used_ram - zfs_ram))

avail_ram=$(free -m | awk 'NR==2{print $4}')

# Print the results
echo "Total system RAM: $total_ram MB"
echo "RAM used by ZFS cache: $zfs_ram MB"
echo "RAM being used (excluding ZFS cache): $used_ram MB"
echo "Available RAM: $avail_ram MB"
