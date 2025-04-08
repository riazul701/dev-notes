# Fedora-GRUB.md

# Fedora & Windows Dual Boot

## Windows Install Error : Multiple `EFI` Partition (Dual Boot)

* During windows install, multiple `efi` partition shows error:
```
Windows Setup

The partitions on the disk selected for installation are not in the recommended order. For additional information about installing to GPT disks go to the Microsoft website (www.microsoft.com) and search for GPT.

Do you want to proceed with installation?
```

* In dual boot (fedora & windows), this happens because there are two `ESP` (EFI System Partition) partitions, with "File System"=`fat32`, Flags=`boot, esp`
  * Deleting fedora's `ESP` partition, solves the problem
  * Windows EFI Partition : "File System"=`fat32`, Flags=`boot, esp, no_automount`
  * Microsoft reserved partition : "File System"=`unknown`, Flags=`msftres, no_automount`
  * Fedora EFI Partition : "File System"=`fat32`, Flags=`boot, esp`

* [Partitions on the disk are not in the correct order when attempting dual boot installation](https://answers.microsoft.com/en-us/windows/forum/all/partitions-on-the-disk-are-not-in-the-correct/d09936f5-5581-4036-8b00-d794dfa0415c)

* Boot Repair Disk Message
  * Please enable a repository containing the [grub-efi] packages in the software sources of Fedora Linux 41 (Forty One) (/dev/sda6). Then try again
    * `sudo dnf install grub2-efi`

## [Restoring the bootloader using the Live disk](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#_restoring_the_bootloader_using_the_live_disk)

* `sudo su` : Switch to `root` user

* Sometimes, especially after a secondary operating systems has been installed, the master boot record gets damaged which then prevents the original Linux system from booting.

* If this happens, it is necessary to reinstall `GRUB2` to recreate the original settings. The process not only discovers all installed operating systems, but usually adds them to the `GRUB2` configuration files, so they will all become bootable by `GRUB2`.

**Before you start**

* Get the Fedora Live ISO from [fedoraproject.org](https://fedoraproject.org/).

* Prepare a bootable device using the downloaded ISO, either a CD or a USB.

**Procedure**

* Boot the Fedora live system from the bootable device you have created.

* Open the terminal.

* Examine the partition layout and identify the `/boot` and the `/root` partition.
  * `# lsblk -f -p`
  * `sudo fdisk -l` : Show partitions with size

* If your `/root` partition is encrypted by LUKS, it must be decrypted.
  * Make sure the crypt module is in use. : `# modprobe dm-crypt`
  * Decrypt the `/root` partition (e.g. `/dev/sda3`). : `# cryptsetup luksOpen /dev/sda3 myvolume`
  * The decrypted device (i.e. `myvolume`) will be accessible under `/dev/mapper`.

* Follow the BTRFS steps (used by default in Fedora 33 or newer).
  * Mount the `/root` partition.
    * For LUKS. : `# mount /dev/mapper/myvolume /mnt -o subvol=root`
    * For non-LUKS. : `# mount /dev/sda3 /mnt -o subvol=root` [For LVM]
      * `# mount /dev/sda3 /mnt` [For Non LVM]

* Follow the LVM steps (used by default before Fedora 33).
  * Scan the LVM volumes for the volume group corresponding to the `/root` partition. : `# vgscan`
  * Activate the volume group (e.g. `fedora`). : `# vgchange -ay fedora`
  * Find the logical volume corresponding to `/root`. : `# lvs`
    * The logical volume will be accessible under `/dev/mapper`.
  * Mount the logical volume (e.g. `/dev/mapper/fedora-root`) corresponding to the `/root` partition. : `# mount /dev/mapper/fedora-root /mnt`

* Mount the `/boot` partition (e.g. `/dev/sda2`). : `# mount /dev/sda2 /mnt/boot`

* Mount system processes and devices into the `/root` filesystem.
```
# mount -o bind /dev /mnt/dev
# mount -o bind /proc /mnt/proc
# mount -o bind /sys /mnt/sys
# mount -o bind /run /mnt/run
```

* On UEFI systems, bind the `efivars` directory and mount the EFI system partition (e.g. `/dev/sda1`).
```
# mount -o bind /sys/firmware/efi/efivars /mnt/sys/firmware/efi/efivars
# mount /dev/sda1 /mnt/boot/efi
```

* Change your filesystem to the one mounted under `/mnt`. : `# chroot /mnt`

* Re-install `GRUB2`.
  * On UEFI systems, several packages are required. : `# dnf reinstall shim-\* grub2-efi-\* grub2-common`
  * On BIOS systems, specify the disk (e.g. `/dev/sda`) where `GRUB2` should be installed. : `# grub2-install /dev/sda`

* Re-generate the `GRUB2` configuration file. : `# grub2-mkconfig -o /boot/grub2/grub.cfg`

* Sync and exit the chroot. : `# sync && exit`

* Reboot the system.

## `chroot` bash path issue (sometimes)

* chroot: failed to run command '/bin/bash': No such file or directory
  * This problem occurs, because original `root` partition is not mounted to `/mnt`

* [Reinstall Grub on Fedora from live image](https://unix.stackexchange.com/questions/761571/reinstall-grub-on-fedora-from-live-image)

## Internet connection issue (sometimes)

* `ping google.com`
```
ping: google.com Temporary failure in name resolution
```
* `ping 8.8.8.8` works [it is google's IP]

* [How to Resolve the "Temporary failure in name resolution" Error](https://phoenixnap.com/kb/temporary-failure-in-name-resolution)
* [No internet connection in chroot environment (customizing iso)](https://unix.stackexchange.com/questions/481860/no-internet-connection-in-chroot-environment-customizing-iso)

## Fedora Emergency Mode

* This problem occurs, because `/dev/sda` partitions name/number and `UUID` changed, which does not match with `UUID` in `/etc/fstab`

* Delete fedora `ESP` partition 600 MiB -> Create `fat32` partition 600 MiB -> Repair GRUB using official docs -> From motherboard UEFI menu, boot from file -> Shows Error
```
You are in emergency mode. After logging in, type "journalctl -xb" to view system logs, "systemctl reboot" to reboot, or "exit" to continue bootup.

Cannot open access to console, the root account is locked.
See sulogin(8) man page for more details.

Press Enter to continue.
```
**[How to get your Linux system out of emergency mode BY Mike's Tech Tips](https://www.youtube.com/watch?v=-2wca_0CpXY)**

* When GRUB menu is shown, then press `e` to edit the commands before booting
  * or press `c` for a command-line (GRUB)

* [Ubuntu 18.04 can't boot (emergency mode)](https://askubuntu.com/questions/1098434/ubuntu-18-04-cant-boot-emergency-mode)
* [fstab => ArchLinux Wiki](https://wiki.archlinux.org/title/Fstab)
* [How to edit /etc/fstab when system boots to read only file system?](https://unix.stackexchange.com/questions/185026/how-to-edit-etc-fstab-when-system-boots-to-read-only-file-system)
* `lsblk` : See partition name/number

* [How To Use UUID To Mount Partitions / Volumes Under Ubuntu Linux](https://www.cyberciti.biz/faq/linux-finding-using-uuids-to-update-fstab/)
