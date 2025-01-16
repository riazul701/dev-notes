# Boot-Repair.md

## Websites

* {3} [boot-repair-disk by: yannubuntu](https://sourceforge.net/projects/boot-repair-cd/)
  * {4} [boot-repair by: yannubuntu](https://sourceforge.net/projects/boot-repair/)
  * {9} [OS-uninstaller by: yannubuntu](https://sourceforge.net/projects/os-uninstaller/)
* {5} [EasyBCD => Take control of your boot loader](https://neosmart.net/EasyBCD/)
* {6} [Super Grub2 Disk](https://www.supergrubdisk.org/super-grub2-disk/) <sup>{2}</sup>
  * {7} [Super Grub2 Disk GitHub](https://github.com/supergrub/supergrub) <sup>{2}</sup>
  * {8} [distrowatch.com => Super Grub2 Disk](https://distrowatch.com/table.php?distribution=supergrub)

## Notes

* "GRUB" is most common boot loader system. "Systemd-boot" is default boot loader of Arch Linux.

# OS Install/Uninstall

## OS Uninstaller

* {9} [OS-uninstaller by: yannubuntu](https://sourceforge.net/projects/os-uninstaller/)

* HOW TO GET OS-UNINSTALLER:
  * RECOMMENDED: boot on Boot-Repair-Disk (https://sourceforge.net/p/boot-repair-cd). A software (Boot-Repair) will start automatically, close it. Then launch OS-Uninstaller from the bottom-left menu.

## Sparky-Linux Installation

* ESP = EFI System Partition
* Shows follwing warning during OS installation in UEFI mode (Not BIOS) [GPT Partition]:
  > No EFI system partition configured
  > An EFI system partition is necessary to start Sparky.
  > To configure an EFI system partition, go back and select or create a suitable filesystem. The filesystem must be mounted on `/boot/efi`. The filesystem must have type `FAT32`. The filesystem must be at least 300 MiB in size. The filesystem must have flag `boot` set.
  > You can continue without setting up an EFI system partition but your system may fail to start.
  
* Note: For AntixLinux-23, `/boot/efi` is named as `ESP`

## Antix-OS Installation

* ESP = EFI System Partition
* Choose partitions (During Installation of Antix-23. Note: Antix-22 does not have this issue)
  * ERROR => "antiX Linux Installer" shows Dialog:
    * This system uses EFI, but no valid EFI system partition was assigned to `/boot/efi` separately. Are you sure to continue?
  * Solution => In hard disk `sda1` create partition:
    * Size: 300.0 MB; Use For: ESP; Format: Preserve (FAT32)

* Durint Antix-OS installation, do not Check/Tick "Root (administrator) Account". Because it cause problems during operating-system login.

## Windows-10 Installation

* During Windows-10 installation in UEFI mode (GPT Partition), installer creates 2 more partition, 100MB and 16MB for boot-loader.
* In Dual Boot with Linux, Windows installer shows following error, if linux has 300 MiB `/boot/efi` (type `FAT32`) partition:
  > Title "Windows Setup"
  > The partitions on the disk selected for installation are not in the recommended order. For additional information about installing to GPT disks go to the Microsoft website (www.microsoft.com) and search for GPT.
  > Do you want to proceed with installation.
* Before Windows-10 installation, delete previous "Windows Boot Manager" from BIOS, Otherwise during computer starts, it will show 2 boot options, where 1 is empty/not-Works. Also delete previous boot-loader's 2 partition 100MB and 16MB.

# Boot Repair

## Boot Repair Disk Failure

* In dual boot system, there are two boot managers in motherboard UEFI. One for Linux and other for Windows.
  * Before reinstall Linux, remove Linux's boot manager.
  * Before reinstall Windows, remove Windows's boot manager.
  * If "boot-repair-disk" <sup>{3}</sup> can not restore boot manager properly, then make linux boot manager default in motherboard and add windows boot manager to it, or refresh if previously added.

* Add windows boot manager to linux boot manager, or refresh if previously added.
  * {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

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

* next-sl: {11}

* Websites
  * {3} [boot-repair-disk](https://sourceforge.net/projects/boot-repair-cd/)
    * {4} [boot-repair by: yannubuntu](https://sourceforge.net/projects/boot-repair/)
    * {9} [OS-uninstaller by: yannubuntu](https://sourceforge.net/projects/os-uninstaller/)
  * {5} [EasyBCD => Take control of your boot loader](https://neosmart.net/EasyBCD/)
  * {6} [Super Grub2 Disk](https://www.supergrubdisk.org/super-grub2-disk/) <sup>{2}</sup>
    * {7} [Super Grub2 Disk GitHub](https://github.com/supergrub/supergrub) <sup>{2}</sup>
    * {8} [distrowatch.com => Super Grub2 Disk](https://distrowatch.com/table.php?distribution=supergrub)


* Guides
  * [This boot repair iso that I found on Sourceforge saved me](https://www.reddit.com/r/linuxmint/comments/193egjj/this_boot_repair_iso_that_i_found_on_sourceforge/?rdt=48191)

* YouTube Tutorials
  * {1} [How to Dual-Boot Linux Mint 22 and Windows 11: Step-by-Step Guide BY Learn Linux TV](https://www.youtube.com/watch?v=Nn7CPlUpflk)
  * {2} [How to Fix Dual Boot Problems BY Chris Titus Tech](https://www.youtube.com/watch?v=gEB6JEYZekE)
  * {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * [Fixing Linux with Rescatux BY Switched to Linux](https://www.youtube.com/watch?v=vqlgAVyRaqs)
