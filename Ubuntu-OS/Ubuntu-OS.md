# Ubuntu OS

## Website
* [Easy Ubuntu Learning: সহজ উবুন্টু শিক্ষা](https://adnan.quaium.com/ubuntu)
* [Ubuntu and Derivatives Download](https://cdimage.ubuntu.com/)
* [Repology, the packaging hub](https://repology.org/)
* [OSBoxes | VirtualBox Image Download](https://www.osboxes.org/)
* [LinuxVMImages | VirtualBox Image Download](https://www.linuxvmimages.com/)

## Commands
* Open GUI-App in Background without blocking Terminal: `sudo gedit &`
* Install "deb" file using "dpkg": `sudo dpkg --install vlc.deb`

# Boot Repair

## Guides (Boot Repiar)
* [How to repair the GRUB bootloader using a Ubuntu Live USB drive](https://www.fosslinux.com/4477/how-to-repair-the-grub-bootloader-using-a-ubuntu-live-usb-drive.htm)
* [‘Boot Repair’ for Ubuntu, Linux Mint, and elementary OS can fix Bootloader issues](https://www.fosslinux.com/1521/boot-repair-for-ubuntu-linux-mint-and-elementary-os-can-fix-bootloader-issues.htm)

# Resource Management

## Definitions
* "systemd": This daemon/background service loads entire ubuntu operating system. Some linux operating system may use different service. "systemctl" command controls "systemd" service.
* "journald": It is a error logging service. "journalctl" command controls "journald" service.
* "rsyslogd": It is a error logging service.

## Notes
* In Linux error logging causes high cpu, ram and disk usage. Disable them to save resource. Some error loggin services are "journald", "rsyslogd".
* In Linux log files consume lot of storage (may be 50GB or higher). Empty them to save hard disk space.

## Guides (Resource Management)
* [Ubuntu Running Slow? 8 Tips to Speed Up Your Linux PC](https://www.makeuseof.com/tag/ubuntu-running-slow-5-tips-speed-linux-pc/#improving-ubuntu-39-s-performance)
* [How to Fix High CPU Usage in Linux](https://www.maketecheasier.com/fix-high-cpu-usage-linux/?amp)
* [how-to-permanently-disable-systemd-journald-service](https://forums.fedoraforum.org/showthread.php?292543-how-to-permanently-disable-systemd-journald-service)

## Commands (Resource Management)
* Show resource usage: `top`
* Disable "journald" logging: `systemctl mask systemd-journald.service` [Shows a response telling that the service has been linked to /dev/null, which will make sure that it doesn't start at boot until you reverse the process by using unmask instead of mask.]

# Problem and Solution

# References

* Installation
  * {1}

* Configuration
  * {51} [Switching to i3 in 18.04](https://askubuntu.com/questions/1044026/switching-to-i3-in-18-04)
  * {52} [Removing GNOME and only use I3](https://www.reddit.com/r/i3wm/comments/f1dhar/removing_gnome_and_only_use_i3/)

* Tutorial Article
  * {101} [Systemd Units Explained with Types and States](https://www.computernetworkingnotes.com/linux-tutorials/systemd-units-explained-with-types-and-states.html)

* YouTube Tutorial
  * {151} [Systemd Deep-Dive: A Complete, Easy to Understand Guide for Everyone](https://www.youtube.com/watch?v=Kzpm-rGAXos)
  * {152} [Learn CentOS 21 - journalctl](https://www.youtube.com/watch?v=j-nINFGrA_Q)
