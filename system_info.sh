#Autor: Erick Cruz

#$(date): shows you date
#$(hostname): shows machine hostname
#free -h: check memory status (total, used, free, shared, buff/cache, available) 

#!/bin/bash
echo "---Server Status---"
echo "Date and Time: $(date)"
echo "Hostname: $(hostname)"
echo "RAM Usage:"
free -h
echo "--------------------"
