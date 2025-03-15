# Boot-Repair-Disk.md

# OS Install/Uninstall

## OS Uninstaller

* {9} [OS-uninstaller by: yannubuntu](https://sourceforge.net/projects/os-uninstaller/)

* HOW TO GET OS-UNINSTALLER:
  * RECOMMENDED: boot on Boot-Repair-Disk (https://sourceforge.net/p/boot-repair-cd). A software (Boot-Repair) will start automatically, close it. Then launch OS-Uninstaller from the bottom-left menu.

# Boot Repair

## Boot Repair Disk Failure

* In dual boot system, there are two boot managers in motherboard UEFI. One for Linux and other for Windows.
  * Before reinstall Linux, remove Linux's boot manager from motherboard. Also format/delete Linux boot partitions.
  * Before reinstall Windows, remove Windows's boot manager from motherboard. Also format/delete Windows boot partitions.
  * If "boot-repair-disk" <sup>{3}</sup> can not restore boot manager properly, then make linux boot manager default in motherboard and add windows boot manager to it, or refresh if previously added.

## Boot Repair Disk ISO and Software Usage

* {3} [boot-repair-disk by: yannubuntu](https://sourceforge.net/projects/boot-repair-cd/)

* ALWAYS USE "BOOT-REPAIR-DISK" ISO. Use "Recommended Repair (repairs most frequent problems)" of it.
  * DO NOT USE "linuxmint-22-xfce-64bit.iso" -> "Boot Repair" <sup>{4}</sup>. It does not work.
  * So keep "boot-repair-disk" <sup>{3}</sup> in Pendrive.

* "Boot-Repair" software is built-in into "Antix-Linux" operating system's ISO file.
  * "EFI System Partition (ESP)" is used for boot repair.
  * It only works, when Antix-Linux is used, Not other Linux like SparkyLinux.
  * Do not use Antix-Linux's built-in boot repair, because it fails to boot into linux-os when windows-os reinstalled and then boot repaired in dual boot system.

## Boot-Repair-Disk Message

* [boot-repair-disk](https://sourceforge.net/projects/boot-repair-cd/)

* Boot-Repair-Disk's success message
  > Boot successfully repaired.
  > A new file (/var/log/boot-repair/{{date_time}}/Boot-Info_{{date_time}}.txt) will open in your text viewer.
  > In case you still experience boot problem, indicate its content to: 
  > boot_repair@gmail.com or to your favorite support forum.
  > You can now reboot your computer.
  > Please do not forget to make your UEFI firmware boot on the SparkyLinux (7.6) entry (sda2/efi/sparky/grubx64.efi file)!
  > If your computer reboots directly into Windows, try to change the boot order in your UEFI firmware.
  > If your UEFI firmware does not allow to change the boot order, change the default boot entry of the Windows bootloader.
  > For example you can boot into Windows, then type the following command in an admin command prompt:
  > bcdedit /set {bootmgr} path \EFI\sparky\grubx64.efi

# References

## Websites

* {3} [boot-repair-disk by: yannubuntu](https://sourceforge.net/projects/boot-repair-cd/)
  * {4} [boot-repair by: yannubuntu](https://sourceforge.net/projects/boot-repair/)
  * {9} [OS-uninstaller by: yannubuntu](https://sourceforge.net/projects/os-uninstaller/)
