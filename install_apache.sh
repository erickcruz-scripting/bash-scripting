#!/bin/bash

#Automation Script to install Apache in RHELv10
#Autor: Erick Cruz


echo "---Apache Installation---"

#Update and install apache package
sudo dnf install httpd -y

#Run and deploy to start with the server
sudo systemctl start httpd
sudo systemctl enable httpd

#Start page creation
echo "Server configured properly by: " | sudo tee /var/www/html/index.html

#Firewall Configuraton
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo "---Success----"

