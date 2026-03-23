#Autor: Erick Cruz

#sudo dnf clean all: clean all dependences in dnf package manager
#sudo rm -rf /tmp*/: remove tmp files 
#df -h: show current disk size

#!/bin/bash
echo "Running System Cleaning..."
sudo dnf clean all 
sudo rm -rf /tmp*/
echo "Cleaning Complete, Current Disk Size:"
df -h /

