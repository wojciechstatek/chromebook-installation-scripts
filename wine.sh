#!/bin/bash
CODENAME=$(grep '^VERSION_CODENAME=' /etc/os-release | cut -d'=' -f2)

# Add Windows CPU architecture to 
sudo dpkg --add-architecture i386

# Save WineHQ key 
sudo mkdir -pm755 etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/$CODENAME/winehq-$CODENAME.sources

sudo apt install --install-recommends winehq-stable
