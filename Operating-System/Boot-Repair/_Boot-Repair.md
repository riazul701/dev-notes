# Commands/Usage

* `apt show os-prober`

# Boot-Repair.md

## Notes

* "Boot-Repair-Disk" is better than "Super-Grub2-Disk". "Super-Grub2-Disk" sometimes does not work.

## Boot-Manager and Boot-Loader

* "GRUB" is most common boot loader system. "Systemd-boot" is default boot loader of Arch Linux. Others - "rEFInd", "SysLinux", "LILO (Linux Loader)", "EFISTUB"

* The distinction is that rEFInd is just a boot manager, whereas Grub is both a boot manager and a bootloader. <sup>{12}</sup>

## Motherboard's UEFI Boot Manager

* In dual boot system, there are two boot managers in motherboard's UEFI. One for Linux and other for Windows.
  * Before reinstall Linux, remove Linux's boot manager from motherboard. Also format/delete Linux boot partitions.
  * Before reinstall Windows, remove Windows's boot manager from motherboard. Also format/delete Windows boot partitions.

## Dual Boot SparkyLinux with Windows-OS

* {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

# OS Install/Uninstall

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

## Add windows boot manager to linux boot manager

* Add windows boot manager to linux boot manager, or refresh if previously added.
  * {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

# References

* next-sl: {13}

## Websites

* {3} [boot-repair-disk by: yannubuntu](https://sourceforge.net/projects/boot-repair-cd/)
  * {4} [boot-repair by: yannubuntu](https://sourceforge.net/projects/boot-repair/)
  * {9} [OS-uninstaller by: yannubuntu](https://sourceforge.net/projects/os-uninstaller/)

* {5} [EasyBCD => Take control of your boot loader](https://neosmart.net/EasyBCD/)

* {6} [Super Grub2 Disk](https://www.supergrubdisk.org/super-grub2-disk/) <sup>{2}</sup>
  * {7} [Super Grub2 Disk GitHub](https://github.com/supergrub/supergrub) <sup>{2}</sup>
  * {8} [distrowatch.com => Super Grub2 Disk](https://distrowatch.com/table.php?distribution=supergrub)

## Tutorials

* [Restoring GRUB After Installing Windows](https://www.cybrary.it/blog/restoring-grub-installing-windows)

## Guides
  
* [This boot repair iso that I found on Sourceforge saved me](https://www.reddit.com/r/linuxmint/comments/193egjj/this_boot_repair_iso_that_i_found_on_sourceforge/?rdt=48191)

* Knowledge
  * {12} [Grub2 vs systemd-boot vs Refind: Pros & cons and benchmarks?](https://www.reddit.com/r/linuxquestions/comments/tjui2x/grub2_vs_systemdboot_vs_refind_pros_cons_and/)

## YouTube Tutorials

* {1} [How to Dual-Boot Linux Mint 22 and Windows 11: Step-by-Step Guide BY Learn Linux TV](https://www.youtube.com/watch?v=Nn7CPlUpflk)
* {2} [How to Fix Dual Boot Problems BY Chris Titus Tech](https://www.youtube.com/watch?v=gEB6JEYZekE)
* {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
* {11} [Fixing Linux with Rescatux BY Switched to Linux](https://www.youtube.com/watch?v=vqlgAVyRaqs)

* `/etc/fstab` file
  * [Linux Crash Course - The /etc/fstab file BY Learn Linux TV](https://www.youtube.com/watch?v=A7xH74o6kY0)
