#!/bin/bash
echo "Running System Cleaning..."
sudo dnf clean all
sudo rm -rf /tmp*/
echo "Cleaning Complete, Current Disk Size:"
df -h /

