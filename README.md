# Dual-Boot Reboot Scripts for Steam Deck
This repository provides simple scripts to streamline dual-booting between Windows and SteamOS on the Steam Deck without relying on Clover or any third-party bootloaders.

By default, Windows modifies the boot order to prioritize itself, requiring manual intervention via the BIOS to switch back to SteamOS. These scripts automate the process:

A PowerShell script (.ps1) for Windows that reboots directly into SteamOS.
A Bash script (.sh) for SteamOS that reboots directly into Windows.


## How windows script

Install WSL

enable sudo in settings/system/for developers

Run in powershell.
```
sudo efibootmgr
```

Find Windows Boot Manager (BootXXXX* Windows Boot Manager).

change .ps1 to your number

Create a shortcut and and in properties/advances tick run as admin


## SteamOS script

Find Windows efi number
change the efi number in the .sh file

run the following command in the terminal to list 
```
efibootmgr 
```
Enable to run efibootmgr as sudo without requiring sudo.
sudo EDITOR=nano visudo
Add the following line to the end of the document:
```
deck ALL=(ALL) NOPASSWD: /usr/bin/efibootmgr
```
To make it executable run:
```
chmod +x reboot-to-windows.sh
```
### add to Gaming mode
Open Steam and add the .sh file as a non-Steam game. Now, you can also use it in Gaming mode.


When booting into Windows, the system sets Windows as the default OS. If you don’t run the script before restarting, Windows will continue to load by default until you manually change the boot order in the BIOS.
On SteamOS, you need to override the boot order each time you switch from Windows; otherwise, the system will boot into Windows on the next startup.

In this repository, you can find a runnable service, that ensures SteamOS remains the default boot option until you choose to change it.
https://github.com/scawp/Steam-Deck.Force-SteamOS-On-Boot

Compatibility
Tested on SteamOS 3.6.22 Beta and Windows 11.
