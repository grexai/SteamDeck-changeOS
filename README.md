# Dual-Boot Reboot Scripts for Steam Deck
This repository provides simple scripts to streamline dual-booting between Windows and SteamOS on the Steam Deck without relying on Clover or any third-party bootloaders.

By default, Windows modifies the boot order to prioritize itself, requiring manual intervention via the BIOS to switch back to SteamOS. These scripts automate the process:

A PowerShell script (.ps1) for Windows that reboots directly into SteamOS.
A Bash script (.sh) for SteamOS that reboots directly into Windows.


## How windows script

Install WSL
Find efi SteamOS boot number with the following command
change .ps1 to your number

Create a shortcut and and in properties/advances tick run as admin


## SteamOS script

Find Windows efi number
change the efi number in .sh file
add to sudoers
run the following command in the terminal
sudo EDITOR=nano visudo

```
command
```

### add to Gaming mode
Open steam and add the .sh file as non steam game. Now you will be able to use it from Gaming mode too.



When booting into Windows, the system sets Windows as the default OS. If you don’t run the script before restarting, Windows will continue to load by default until you manually change the boot order in the BIOS.
On SteamOS, you need to override the boot order each time you switch from Windows; otherwise, the system will boot into Windows on the next startup.

These scripts ensure SteamOS remains the default boot option until you choose to change it.
https://github.com/scawp/Steam-Deck.Force-SteamOS-On-Boot

Compatibility
Tested on SteamOS 3.6.22 Beta and Windows 11.
