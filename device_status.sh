#!/bin/bash

#Autor: Erick Cruz

#Script to check the status of devices connected to the server
#ip link show: lists all network interfaces and their state
#lsusb: lists USB devices connected
#lsblk: lists block devices (disks, partitions)
#df -h: shows disk usage per mounted device

echo "=============================="
echo "   Connected Devices Status   "
echo "=============================="
echo "Date: $(date)"
echo ""

# Network interfaces
echo "--- Network Interfaces ---"
ip link show | awk '/^[0-9]+:/{
    split($2, name, ":")
    iface = name[1]
    state = /UP/ ? "UP" : "DOWN"
    printf "Interface: %-15s State: %s\n", iface, $9
}'
echo ""

# USB devices
echo "--- USB Devices ---"
if command -v lsusb &>/dev/null; then
    lsusb_output=$(lsusb)
    if [ -z "$lsusb_output" ]; then
        echo "No USB devices found."
    else
        echo "$lsusb_output"
    fi
else
    echo "lsusb not available."
fi
echo ""

# Block devices
echo "--- Block Devices ---"
lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,STATE 2>/dev/null || lsblk
echo ""

# Disk usage
echo "--- Disk Usage ---"
df -h --output=source,size,used,avail,pcent,target | grep -v tmpfs | grep -v udev
echo ""

echo "=============================="
echo "  End of Device Status Report "
echo "=============================="
