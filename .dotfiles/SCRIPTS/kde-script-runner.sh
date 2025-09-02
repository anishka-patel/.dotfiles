#!/bin/bash
# Author: ANISHKA PATEL
# Created: 21-08-2022
# Description: Script to run in Plasma Command Output Widget
# Script is customised to cater to arch plasma setups
# Please modify appropriately to cater to other setups
# Dependencies : Resolution
# - nerd-fonts : yay -S nerd-fonts-complete
# - mpstat     : pacman -S sysstat
# - iostat     : pacman -S iostat
# - ifstat     : pacman -S sysstat

CURRTIME=$(date +"%H:%M (%Z)")
CURRDATE=$(date +"%b | %d.%m.%y | %a")
KERNEL=$(uname -r | awk -F '-' '{print $1}')
DISTRO=$(cat /etc/os-release | grep ^NAME | awk -F= '{print $2}' | sed 's/\"//g'| awk '{print $1}')
IFNAME=$(ip -brief a | grep "UP" |head| awk '{print $1}')
IFADDR=$(ip -brief a | grep "UP" |head| awk '{print $3}'| sed 's/...$//' )
echo "$CURRTIME"
echo "$CURRDATE"
echo ""
echo "$(printf "   %8s %16s " "$DISTRO" "$KERNEL" )"
echo "$(printf "   %8s %16s " "$USER" "$HOSTNAME")"
echo "$(printf "   %8s %16s " "$IFNAME" "$IFADDR")"
echo ""
echo "---------------------------------------"
echo ""
CPUUSRINFO=$(mpstat 1 1 | grep -i average | awk '{print $3}')
CPUSYSINFO=$(mpstat 1 1 | grep -i average | awk '{print $5}')
CPUIDLINFO=$(mpstat 1 1 | grep -i average | awk '{print $12}')
echo "$(printf "CPU:   %02d%%  󰇅 %02d%%   %02d%%" "$CPUUSRINFO" "$CPUSYSINFO" "$CPUIDLINFO")"
MEMTOTINFO=$(cat /proc/meminfo |
  numfmt --field 2 --from-unit=Ki --to-unit=Gi |
  sed 's/ kB//g'| grep -i memtotal | awk '{print $2}')
MEMAVLINFO=$(cat /proc/meminfo |
  numfmt --field 2 --from-unit=Ki --to-unit=Gi |
  sed 's/ kB//g'| grep -i memavailable | awk '{print $2}')
echo "$(printf "MEM:   %02dG   %02dG   %02dG" "$MEMTOTINFO" $((MEMTOTINFO - MEMAVLINFO)) "$MEMAVLINFO")"
SWPTOTINFO=$(cat /proc/meminfo |
  numfmt --field 2 --from-unit=Ki --to-unit=Gi |
  sed 's/ kB//g' | grep -i swaptotal | awk '{print $2}')
SWPAVLINFO=$(cat /proc/meminfo |
  numfmt --field 2 --from-unit=Ki --to-unit=Gi |
  sed 's/ kB//g' | grep -i swapfree | awk '{print $2}')
echo "$(printf "SWP:   %02dG   %02dG   %02dG" "$SWPTOTINFO" $((SWPTOTINFO - SWPAVLINFO)) "$SWPAVLINFO")"
echo ""
IONAME=$(lsblk | grep disk | tail -1 | awk '{print $1}')
IOREADINFO=$(iostat | grep "$IONAME" | awk '{print $3}')
IOWRITINFO=$(iostat | grep "$IONAME" | awk '{print $4}')
echo "$(printf "IO: %-8s %6d   %6d  " "$IONAME" "$IOREADINFO" "$IOWRITINFO")"
# PSUSR=$(ps --user "$USER" | wc -l)
# PSSYS=$(ps --user root | wc -l)
# PSTOT=$(ps -ef | wc -l)
# echo "PRO:    "$PSTOT"    "$PSUSR"    "$PSSYS
# echo "---------------------------------------"
IFRXINFO=$(ifstat | grep "$IFNAME" | awk '{print $6}')
IFTXINFO=$(ifstat | grep "$IFNAME" | awk '{print $8}')
echo "$(printf "IF: %-8s %6d   %6d  " "$IFNAME" "$IFTXINFO" "$IFRXINFO")"
echo ""
echo "---------------------------------------"
PACALLPKGS=$(pacman -Q | wc -l)
PACMANPKGS=$(pacman -Qn | wc -l)
AURPKGS=$(yay -Qm | wc -l)
FLATPAKPKGS=$(flatpak list | wc -l)
SNAPPKGS=$(snap list --all | wc -l)
APXPKGS=$(apx list -i | wc -l)
BREWPKGS=$(brew list | wc -l)
PYTHONPKGS=$(pip list | wc -l)
NODEPKGS=$(npm -g list | wc -l)
RUSTPKGS=$(cargo install --list| grep -v :$ | wc -l)
GOPKGS=$(go list ... | wc -l)
APPIMAGEPKGS=$(appimage-cli-tool list | grep -i AppImage | wc -l)
echo -n "Pacman  󰏔""""$(printf "%5d" "$PACMANPKGS")"
echo "   Aur     󰏔""""$(printf "%5d" "$AURPKGS")"
echo -n "Flatpak 󰏔""""$(printf "%5d" "$FLATPAKPKGS")"
echo "   AppImg  󰏔""""$(printf "%5d" "$APPIMAGEPKGS")"
echo -n "Snap    󰏔""""$(printf "%5d" "$SNAPPKGS")"
echo "   Apx     󰏔""""$(printf "%5d" "$APXPKGS")"
# echo -n "Brew    """"$(printf "%5d" "$BREWPKGS")"
# echo -n "Pacman  """"$(printf "%5d" "$PACALLPKGS")"
# echo "   Flatpak """"$(printf "%5d" "$FLATPAKPKGS")"
echo -n "Npm     󰏔""""$(printf "%5d" "$NODEPKGS")"
echo "   Pip     󰏔""""$(printf "%5d" "$PYTHONPKGS")"
echo -n "Go      󰏔""""$(printf "%5d" "$GOPKGS")"
echo "   Cargo   󰏔""""$(printf "%5d" "$RUSTPKGS")"
echo "---------------------------------------"
echo ""
echo ""
echo "--------------"
echo "--- 󰇅 ---"
echo "Dolphin                   M-e"
echo "KRunner                 M-SPC"
echo "---  ---"
echo "Emacs                     M-n"
echo "Everywhere              M-S-n"
echo "---  ---"
echo "Chrome                    M-i"
echo "Firefox                 M-S-i"
echo "---  ---"
echo "Konsole                 M-RET"
echo "Kitty                 M-S-RET"
echo ""
