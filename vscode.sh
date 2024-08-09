#!bin/bash

#Checks the architecture of system
ARCHITECTURE=$(dpkg --print-architecture)

#Microsoft recommends installation of gnome-keyring for keeping secrets
echo "apt-get update and gnome-keyring installation"
sudo apt-get update > /dev/null 2>&1
sudo apt-get install gnome-keyring -y > /dev/null 2>&1

#Finds download link, stores found link itself and name of version downloaded
response=$(curl -sILo /dev/null -w "%{url_effective}" "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-$ARCHITECTURE")
location="$response"
version=$(echo $location | grep -oE '[^/]+$')

echo "Downloading VS Code"
wget -q $location

echo "Installing VS Code"
sudo dpkg -i $version

echo "Removing installation file"
rm $version

echo "Running VS Code, enjoy coding!"
code
