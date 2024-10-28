#!/bin/bash
version="1.3.0"
cd
clear

# Start

echo "[]""xtt-arch-init ("$version")">>xtt-arch-init.log
time=`date +%x@%T` && echo "["$time"] xtt-arch-init ("$version")">>xtt-arch-init.log
time=`date +%x@%T` && echo "["$time"] (c) 2024 XTT Limited, LLC">>xtt-arch-init.log
echo ""
items=(1 "Desktop/Laptop"
       2 "Tablet/Mobile")
dialog --backtitle "xtt-arch-init ($version)" --title "Welcome!" --msgbox "xtt-arch-init is a linux staging script for staging Arch Linux based devices." 0 0

# Authorize User
dialog --backtitle "xtt-arch-init ($version)" --title "Disclaimer" --yesno "Do you confirm that you are a team member or client of XTT Limited, LLC and have authorization to use this script?" 0 0
discresponse=$?
case $discresponse in
    0) time=`date +%x@%T` && echo "["$time"] User confirmed authorization box.">>xtt-arch-init.log
    1) time=`date +%x@%T` && echo "["$time"] User declined authorization box.">>xtt-arch-init.log && exit
    255) time=`date +%x@%T` && echo "["$time"] User canceled authorization box.">>xtt-arch-init.log && exit
esac

# Prompt Platform

while choice=$(dialog --backtitle "xtt-arch-init ($version)" --title "Platform" \
                 --menu "Please select the platform you are installing on:" 0 0 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case $choice in
        1) platform=desktop
        2) platform=mobile
        *) time=`date +%x@%T` && echo "["$time"] User canceled platform box.">>xtt-arch-init.log && exit
    esac
done
time=`date +%x@%T` && echo "["$time"] Platform: "$platform>>xtt-arch-init.log

# Staging Server
ss=$(dialog --backtitle "xtt-arch-init" --title "Staging Server" --inputbox "Enter your staging server ID" 0 0 'base' 3>&1 1>&2 2>&3 3>&-)
time=`date +%x@%T` && echo "["$time"] SS: "$ss>>xtt-arch-init.log

# Confirm Staging

dialog --backtitle "xtt-arch-init ($version)" --title "Confirm" --yesno "Are you sure you want to begin staging this device?" 0 0
discresponse=$?
case $discresponse in
    0) time=`date +%x@%T` && echo "["$time"] User confirmed begin staging.">>xtt-arch-init.log
    1) time=`date +%x@%T` && echo "["$time"] User declined begin staging.">>xtt-arch-init.log && exit
    255) time=`date +%x@%T` && echo "["$time"] User canceled begin staging.">>xtt-arch-init.log && exit
esac

# Base Dependencies
time=`date +%x@%T` && echo "["$time"] Installing base dependencies...">>xtt-arch-init.log
#Git
sudo echo ""
yes | sudo pacman -S --needed git>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Base Dependencies" 0 0 5 Installing git
done
#base-devel
echo Superuser Re-authorization Needed!
sudo echo ""
yes | sudo pacman -S --needed base-devel>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Base Dependencies" 0 0 10 Installing base-devel
done
# DL Yay
echo Superuser Re-authorization Needed!
sudo echo ""
git clone https://aur.archlinux.org/yay-bin.git &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Base Dependencies" 0 0 12 Installing yay
done
cd yay-bin/
# Make Yay
echo Superuser Re-authorization Needed!
sudo echo ""
makepkg -si>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Base Dependencies" 0 0 20 Installing yay
done
# Fish
echo Superuser Re-authorization Needed!
sudo echo ""
yes | sudo pacman -S fish>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Base Dependencies" 0 0 30 Installing fish
done
# librewolf
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S librewolf-bin>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 33 Installing librewolf
done
# spotify-launcher
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S spotify-launcher>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 36 Installing spotify
done
# steamlink
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S steamlink>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 39 Installing steamlink
done
# spek
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S spek>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 42 Installing spek
done
# discord
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S discord>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 45 Installing discord
done
# obsidian
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S obsidian>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 48 Installing obsidian
done
# element-desktop
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S element-desktop>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 51 Installing element-desktop
done
# winscp
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S winscp>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 54 Installing winscp
done
# remmina
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S remmina remmina-plugin-rdesktop>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 57 Installing remmina
done
# sublime-text-4
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S sublime-text-4>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 63 Installing sublime-text-4
done
# mpd
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S mpd>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 66 Installing mpd
done
# ncmpcpp
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S ncmpcpp>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 69 Installing ncmpcpp
done
# nfs-utils
echo Superuser Re-authorization Needed!
sudo echo ""
yay --sudoloop --noconfirm -S nfs-utils>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Installing Standard Applications" 0 0 72 Installing nfs-utils
done

# Copying Folders
# Downloading init
echo Superuser Re-authorization Needed!
sudo echo ""
git clone github.com/alteredgenome/$ss-arch-init.git>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Applying Configurations" 0 0 75 Downloading $ss-arch-init
done
cd $ss-arch-init/home/alteredgenome
# Copying .config
echo Superuser Re-authorization Needed!
sudo echo ""
mv .config ~/.config>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Applying Configurations" 0 0 80 Copying .config
done
# Copying .scripts
echo Superuser Re-authorization Needed!
sudo echo ""
mv .scripts ~/.scripts>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Applying Configurations" 0 0 90 Copying .scripts
done
cd
# delete yay-bin
echo Superuser Re-authorization Needed!
sudo echo ""
rm -rf yay-bin>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Cleaning Up" 0 0 93 Removing yay-bin
done
# delete arch-init
echo Superuser Re-authorization Needed!
sudo echo ""
rm -rf $ss-arch-init>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Cleaning Up" 0 0 96 Removing $ss-arch-init
done
if [ $platform="mobile" ]; then
    # plasma-mobile
    echo Superuser Re-authorization Needed!
    sudo echo ""
    yay --sudoloop --noconfirm -S plasma-mobile>>xtt-arch-init.log &
    PID=$!
    i=1
    sp="/-\|"
    echo -n ' '
    while [ -d /proc/$PID ]
    do
    dialog --mixedgauge "Applying Platform Tweaks" 0 0 97 Installing plasma-mobile
    done
else
    # plasma-mobile
    sleep 5>>xtt-arch-init.log &
    PID=$!
    i=1
    sp="/-\|"
    echo -n ' '
    while [ -d /proc/$PID ]
    do
    dialog --mixedgauge "Applying Platform Tweaks" 0 0 97 Removing plasma-mobile
    done
fi
# dl dwagent
echo Superuser Re-authorization Needed!
sudo echo ""
wget https://www.dwservice.net/download/dwagent.sh>>xtt-arch-init.log &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Remote Management" 0 0 98 Downloading dwservice
done
# install dwagent
echo Superuser Re-authorization Needed!
sudo echo ""
sudo bash dwagent.sh>>xtt-arch-init.log &
dw=$!
wait $dw
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  dialog --mixedgauge "Remote Management" 0 0 99 Installing dwservice
done
dialog --backtitle "xtt-arch-init ($version)" --title "Finished!" --msgbox "xtt-arch-init has completed the staging process. Press OK to exit." 0 0
