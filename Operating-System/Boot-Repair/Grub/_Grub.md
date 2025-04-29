# Commands/Usage

* `sudo apt-get install grub2` : Install the GRUB 2 package. Watch the terminal. You will soon have to answer a few prompts. <sup>{11}</sup>

* `grub-install <target>` : GRUB 2 can be installed even while you are booted in the OS. You do not need a live environment for that. Just execute the `grub-install` command against the device or the partition you desire. <sup>{11}</sup>
  * `<target>` can be `/dev/hda`, `/dev/sdb`, `/dev/sdc4`, and so forth. <sup>{11}</sup>

* `update-grub` : Command reads the `/etc/grub.d` directory and looks for executable scripts inside it. The scripts are read, in the order of their numbering, and written into the `grub.cfg` file, along with the menu settings read from the `/etc/default/grub` file. <sup>{11}</sup>

* `grub2-mkconfig -o /boot/efi/EFI/<os>/grub.cfg` : If you need to update the configuration file, and you want to do it explicitly, without using the GRUB update command, you will need to specify the correct file as the output. <sup>{11}</sup>
  * For instance, you may get `/boot/efi/EFI/centos/grub.cfg` <sup>{11}</sup>

* `grub2-mkconfig -o /boot/grub2/grub.cfg` : This will recreate the `grub.cfg` file based on your scripts under `/etc/grub.d`. <sup>{11}</sup>

* `sudo upgrade-from-grub-legacy` : Boot both Ubuntu and Windows 7 to make sure everything works properly. Once you're satisfied, boot into Ubuntu and complete the migration process. You can now write GRUB 2 into MBR and make it the default bootloader. <sup>{11}</sup>

* `sudo apt-get install efibootmgr` <sup>{13}</sup>

## GRUB Command List

* `grub-bios-setup`
* `grub-install`
* `grub-macbless`
* `grub-mkconfig`
* `grub-mkdevicemap`
* `grub-probe`
* `grub-reboot`
* `grub-set-default`
* `update-grub`
* `update-grub2`
* `upgrade-from-grub-legacy`

* `/usr/bin/os-prober`

# GRUB.md

## Notes

* GRUB can not be reinstalled/repaired in windows-dual-boot, without separate `/boot` partition. Tested on Fedora-41 Btrfs setup. <sup>{30}</sup>

* UEFI boot menu entry is stored in Motherboard's NVRAM. GRUB makes boot entry in NVRAM, managed by `efibootmgr` command. <sup>{19}</sup>

* LINUX BOOT PARTITIONS
  * On Legacy-BIOS: Separate `/boot` partition is must for GRUB repair/reinstall
  * On UEFI: Separate `/boot` and `/boot/efi` partitions are must for GRUB repair/reinstall

* The most frequent reason for GRUB not booting into the operating system involves another OS's bootloader overwriting GRUB boot configuration. Another cause may be an accidental removal of GRUB configuration files. <sup>{1} {26}</sup>
  * Removal of GRUB config file `/boot/grub2/grub.cfg` (Fedora) OR `/boot/grub/grub.cfg` (Debian), shows `grub>` prompt <sup>{1}</sup>
  * Removal of GRUB config folder `/boot/grub2` (Fedora) OR `/boot/grub` (Debian), shows `grub rescue>` prompt <sup>{1}</sup>

* Make grub config file <sup>{1} {2}</sup>
  * Fedora and other OS use command: `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` <sup>{1} {2}</sup>
  * Debian/Ubuntu use command: `sudo update-grub` <sup>{1} {2}</sup>

* On Windows-OS: Right click on "Start Menu" -> "Disk Management" -> Right click on "Disk 0 (Whole HDD)" -> "Properties" -> "Volumes" -> Check "Partition style"
  * Master Boot Record (MBR) == Legacy BIOS
  * GUID Partition Table (GPT) == UEFI

* On Linux-OS: You can verify that the system has booted using UEFI by checking for the existence of the directory `/sys/firmware/efi` or by running `efibootmgr`. <sup>{19}</sup>

* On MBR, GRUB should be installed on device, not partition <sup>{1}</sup>
  * On GPT, GRUB should be installed on ESP partition.

* Is Windows fast startup or hibernation off? Otherwise grub's os-prober cannot see the Windows install. If new Windows is bitlocker off? <sup>{9}</sup>

* Remember that you should always install Windows first, on the first hard disk, on the first partition (the rule of three first). <sup>{8}</sup>

## Grub Message

* In Grub OS selection screen/menu, message shown at bottom
```
Press enter to boot the selected OS. `e` to edit the commands before booting or `c` for a command-line.
```

* Press `Esc` to return to Grub OS selection screen/menu

## PATH

* `/etc/default/grub` - the file containing GRUB 2 menu settings. <sup>{11}</sup>
* `/etc/grub.d/` - the directory containing GRUB 2 menu creating scripts. <sup>{11}</sup>
* `/boot/grub2/grub.cfg` (Fedora) OR `/boot/grub/grub.cfg` (Debian) - the GRUB 2 configuration file, not editable. <sup>{11}</sup>

* Legacy (old) GRUB
  * `/boot/grub/menu.lst` : Legacy GRUB menu is located on the root partition under this. <sup>{8}</sup>

# OS Prober

* `apt show os-prober` <sup>{4}</sup>

## Add windows boot manager to linux boot manager

**Add windows boot manager to linux boot manager, or refresh if previously added. <sup>{10} {11}</sup>**

* [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE) <sup>{10}</sup>
  * SparkyLinux does not detect Windows-OS on "GRUB" boot loader
  * On SparkyLinux open Terminal and type: `sudo nano /etc/default/grub`
    * To edit graphically, enter command `sudo pcmanfm`, and edit file `/etc/default/grub`
  * Uncomment line `#GRUB_DISABLE_OS_PROBER=false` [Remove `#` at first character] -> Save File
  * Reload GRUB: `sudo update-grub`
  * Restart PC and check "Windows Boot Manager"

# References

* next-sl: {31}

## Websites

* {27} [GNU GRUB Manual 2.12 => Official](https://www.gnu.org/software/grub/manual/grub/grub.html)
* {12} [supergrubdisk.org](https://www.supergrubdisk.org/) <sup>{1}</sup>
* {3} [Grub Customizer](https://launchpad.net/grub-customizer) <sup>{4}</sup>

## Tutorials

* General
  * {19} [GrubEFIReinstall](https://wiki.debian.org/GrubEFIReinstall)
  * {20} [Troubleshoot boot problems by reinstalling GRUB on Linux](https://www.fosslinux.com/115031/troubleshoot-boot-problems-by-reinstalling-grub-on-linux.htm)
  * {22} [Grub2/Installing](https://help.ubuntu.com/community/Grub2/Installing)
  * {21} [Grub2](https://help.ubuntu.com/community/Grub2)
  * {23} [Boot-Repair](https://help.ubuntu.com/community/Boot-Repair)

* Get Instructions From
  * {7} [Restoring GRUB After Installing Windows](https://www.cybrary.it/blog/restoring-grub-installing-windows)
  * {9} [How to install or update Grub after Windows installation](https://askubuntu.com/questions/1483941/how-to-install-or-update-grub-after-windows-installation)
  * {2} [Grub Rescue | Repairing your Bootloader](https://christitus.com/grub-rescue/) <sup>{1}</sup>

* Concept
  * {8} [GRUB bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub.html)
  * {11} [GRUB 2 bootloader - Full tutorial](https://www.dedoimedo.com/computers/grub-2.html)
  * {13} [GRUB2 & EFI recovery - Tutorial](https://www.dedoimedo.com/computers/grub2-efi-recovery.html)
  * {14} [Recover from a badly corrupt Linux EFI installation](https://www.dedoimedo.com/computers/grub2-efi-corrupt-part-recovery.html)
  * {15} [GRUB2, Fedora & can't find command error](https://www.dedoimedo.com/computers/grub2-fedora-command-not-found.html)

* Arch Wiki
  * [Arch boot process](https://wiki.archlinux.org/title/Arch_boot_process)
  * [GRUB](https://wiki.archlinux.org/title/GRUB)
  * [Dual boot with Windows](https://wiki.archlinux.org/title/Dual_boot_with_Windows)

* GRUB Rescue
  * {28} [Using the GRUB2 boot prompt](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#_using_the_grub2_boot_prompt)
  * {25} [How to Use GRUB Rescue to Fix Linux](https://www.howtogeek.com/887757/how-to-use-grub-rescue-to-fix-linux/)
  * {26} [How to Use GRUB Rescue to Fix Linux Boot Failure](https://phoenixnap.com/kb/grub-rescue)

* Fedora: Install/Snapshot
  * {30} [How to Install Fedora 41 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-41-with-snapshot-and-rollback-support) <sup>{29}</sup>

## Guides

* Knowledge
  * [Any mainstream distro that doesn't use Grub by default?](https://www.reddit.com/r/linuxquestions/comments/1ixfakd/any_mainstream_distro_that_doesnt_use_grub_by/)

## YouTube Tutorials

* General
  * {1} [GRUB Rescue | Repairing GRUB BY Chris Titus Tech](https://www.youtube.com/watch?v=r7meKJsjqfY)
  * {4} [How To Fix Multiboot Systems | Windows & Linux BY Chris Titus Tech => Legacy BIOS](https://www.youtube.com/watch?v=3oQfnNhk7qU)
  * {5} [How to Reinstall GRUB | Repair Boot on Linux BY Drew Howden Tech](https://www.youtube.com/watch?v=ZhxBJ3yh2OY)
  * {6} [How to fix Boot issues | stuck at grub prompt | grub rescue prompt | Windows Ubuntu Linux BY Brainers Technology](https://www.youtube.com/watch?v=dB580m1USIs)
  * {10} [How to Dual Boot Sparky Linux and Windows 10/11 BY Sandip Sky](https://www.youtube.com/watch?v=HYEU2KB5sTE)
  * {18} [GRUB Rescue and Repair on Linux | Rescue and Repair your Bootloader! (Ubuntu) BY SavvyNik](https://www.youtube.com/watch?v=LFj_yqk6AUI)

* `/etc/fstab` file
  * [Linux Crash Course - The /etc/fstab file BY Learn Linux TV](https://www.youtube.com/watch?v=A7xH74o6kY0)

* Fedora: Install/Snapshot
  * {29} [How to Install Fedora 41 with Snapshot and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LwM3wUXJyU8)
