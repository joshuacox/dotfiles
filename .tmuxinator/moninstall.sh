#!/bin/bash
# Install a bunch of monitoring tools

# Debian
if type "apt-get" &> /dev/null; then
  sudo apt-get install -y nload iftop iptraf nethogs bmon slurm tcptrack vnstat bwm-ng cbm speedometer netdiag ifstat dstat collectl
fi

# Arch Linux
if type "powerpill" &> /dev/null; then
  sudo powerpill -S --noconfirm nload iftop nethogs bmon vnstat bwm-ng dstat netcfg iptraf-ng netwatch
  TMP=$(mktemp -d)
  cd $TMP; sudo bauerbill -S --aur --noconfirm slurm tcptrack speedometer collectl trafshow
  cd $TMP/build; ls -lh; pwd; ./download.sh && ./build.sh
  sudo rm -Rf $TMP
elif type "pacman" &> /dev/null; then
  sudo pacman -S --noconfirm nload iftop nethogs bmon vnstat bwm-ng dstat
fi
