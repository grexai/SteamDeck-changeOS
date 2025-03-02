# Dual-Boot Reboot Scripts for Steam Deck
This repository provides simple scripts to streamline dual-booting between Windows and SteamOS on the Steam Deck without relying on Clover or any third-party bootloaders.

By default, Windows modifies the boot order to prioritize itself, requiring manual intervention via the BIOS to switch back to SteamOS. These scripts automate the process:

A PowerShell script (.ps1) for Windows that reboots directly into SteamOS.
A Bash script (.sh) for SteamOS that reboots directly into Windows.

## demo 

[![Watch on YouTube](https://img.youtube.com/vi/k7LyJSCFUoo/0.jpg)](https://youtu.be/k7LyJSCFUoo)



## Windows script

Install WSL

enable sudo in settings/system/for developers

Run in Powershell.
```
sudo efibootmgr
```
This is an example output
```
Windows Boot Loader
--------------------
identifier              {current}
description             Windows 11

Windows Boot Loader
--------------------
identifier              {abcd1234-5678-9abc-def012345678}
description             Ubuntu
```

Find Windows Boot Manager (BootXXXX* Windows Boot Manager).

In the .ps1 script change it to your number mine was 5fbc7031-68dd-11ef-a6bc-baf79f51b1b4

```
Start-Process "bcdedit" -ArgumentList "/set `"{fwbootmgr}`" bootsequence `"{5fbc7031-68dd-11ef-a6bc-baf79f51b1b4}`"" -NoNewWindow -Wait
Start-Process "bcdedit" -ArgumentList "/set `"{fwbootmgr}`" displayorder `"{5fbc7031-68dd-11ef-a6bc-baf79f51b1b4}`" /addfirst" -NoNewWindow -Wait
```

Create a shortcut and in Properties/advanced tick run as admin


## SteamOS script

Find Windows's efi number
Run the following command in the terminal to list 
```
efibootmgr 
```
Replace you number (mine was 0002) in the following line in the .sh file:
```
sudo efibootmgr --bootnext 0002 && reboot
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
