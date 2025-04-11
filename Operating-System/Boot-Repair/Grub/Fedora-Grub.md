# Fedora-Grub.md

# Fedora & Windows Dual Boot : Grub Rapair/Reinstall

## Notes

* ESP = EFI System Partition

* Before adding new Windows/Linux UEFI boot menu entry in motherboard, delete existing one.

* In Legacy-BIOS/MBR, where linux `root` partition is logical(extended) drive, windows may format/empty the linux `root` partition.

## Windows Install Error : Multiple `EFI` Partition (Dual Boot)

**Error Message**

* During windows install, multiple `efi` partition shows error:
```
Windows Setup

The partitions on the disk selected for installation are not in the recommended order. For additional information about installing to GPT disks go to the Microsoft website (www.microsoft.com) and search for GPT.

Do you want to proceed with installation?
```

**Solution**

* In dual boot (fedora & windows), this happens because there are two `ESP` (EFI System Partition) partitions, with "File System"=`fat32`, Flags=`boot, esp`

* Deleting fedora's `ESP` partition, solves the problem

* First delete fedora's `ESP` partition, then create windows-os partition. Otherwise above error is shown.

* Make windows partition 600 MiB less, which is for fedora's `ESP` partition.

* Windows will create three partition - EFI partition (100 MB), Reserved partition (16 MB), `C` drive partition.

* Partition List

  * Windows EFI Partition (100 MB) : "File System"=`fat32`, Flags=`boot, esp, no_automount`

  * Microsoft reserved partition (16 MB) : "File System"=`unknown`, Flags=`msftres, no_automount`

  * Fedora EFI Partition (600 MiB) : "File System"=`fat32`, Flags=`boot, esp`

**Information**

* [Partitions on the disk are not in the correct order when attempting dual boot installation](https://answers.microsoft.com/en-us/windows/forum/all/partitions-on-the-disk-are-not-in-the-correct/d09936f5-5581-4036-8b00-d794dfa0415c) <sup>{5}</sup>

* Boot Repair Disk Message (Fedora LXQt 41)
```
Please enable a repository containing the [grub-efi] packages in the software sources of Fedora Linux 41 (Forty One) (/dev/sda6). Then try again
```
* `sudo dnf install grub2-efi`

## [Creating an EFI System Partition](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#create-an-esp) <sup>{6}</sup>

* Alternatively, Use GParted to create `fat32` partition with size "600 MiB"

**Creating an EFI System Partition**

* The UEFI firmware requires to boot from an EFI System Partition on a disk with a GPT label. To create such a partition:

* `$ lsblk -f -p` : List available block devices to find a place to create your ESP.

* `# gdisk /dev/sda` : Create at least a 128 MiB disk partition using a GPT label on the primary hard disk.
  * For the sake of this procedure, we assume that the created partition is recognized as `/dev/sda1`.

* `# mkfs.vfat /dev/sda1` : Format the partition with the `FAT32` file system.

* `# mkdir /boot/efi` : Create the `/boot/efi` directory as a mount point for the new partition.

* `# mount /dev/sda1 /boot/efi` : Mount the partition to the `/boot/efi` mount point.

* Proceed to the next part.

## [Restoring the bootloader using the Live disk](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#_restoring_the_bootloader_using_the_live_disk) <sup>{1}</sup>

* `sudo su` : Switch to `root` user

**Restoring the bootloader using the Live disk**

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
  * In Legacy-BIOS/MBR, if partitions are not displayed correctly using `lsblk`, `fdisk`, then use GParted.

* If your `/root` partition is encrypted by LUKS, it must be decrypted.
  * `# modprobe dm-crypt` : Make sure the crypt module is in use.
  * `# cryptsetup luksOpen /dev/sda3 myvolume` : Decrypt the `/root` partition (e.g. `/dev/sda3`).
  * The decrypted device (i.e. `myvolume`) will be accessible under `/dev/mapper`.

* Follow the BTRFS steps (used by default in Fedora 33 or newer).
  * Mount the `/root` partition.
    * `# mount /dev/mapper/myvolume /mnt -o subvol=root` : For LUKS.
    * `# mount /dev/sda3 /mnt -o subvol=root` : For non-LUKS. [For Legacy-BIOS, Otherwise contents will be mounted inside `root` subdirectory and `/dev`, `/proc`, `/sys`, `/run` mount will not work]
      * `# mount /dev/sda3 /mnt` [For UEFI]

* Follow the LVM steps (used by default before Fedora 33).
  * `# vgscan` : Scan the LVM volumes for the volume group corresponding to the `/root` partition.
  * `# vgchange -ay fedora` : Activate the volume group (e.g. `fedora`).
  * `# lvs` : Find the logical volume corresponding to `/root`.
    * The logical volume will be accessible under `/dev/mapper`.
  * `# mount /dev/mapper/fedora-root /mnt` : Mount the logical volume (e.g. `/dev/mapper/fedora-root`) corresponding to the `/root` partition.

* `# mount /dev/sda2 /mnt/boot` : Mount the `/boot` partition (e.g. `/dev/sda2`).

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

* `# chroot /mnt` : Change your filesystem to the one mounted under `/mnt`.

* Re-install `GRUB2`.
  * `# dnf reinstall shim-\* grub2-efi-\* grub2-common` : On UEFI systems, several packages are required.
  * `# grub2-install /dev/sda` : On BIOS systems, specify the disk (e.g. `/dev/sda`) where `GRUB2` should be installed.

* `# grub2-mkconfig -o /boot/grub2/grub.cfg` : Re-generate the `GRUB2` configuration file.

* `# sync && exit` : Sync and exit the chroot.

* Reboot the system.

## [Solving problems with UEFI bootloader](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#solving-problems-with-uefi-bootloader) <sup>{7}</sup>

* (Tested in VirtualBox) If there is not Boot Entry in Motherboard UEFI

  * Add Boot Entry to Motherboard UEFI Menu : Go to Motherboard UEFI Menu -> Boot Maintenance Manager -> Boot Options -> Add Boot Option -> Select Linux from 2 (Linux and Windows) ESP partitions -> Choose Path "EFI/Fedora/grubx64.efi"
  
  * One time Boot from Motherboard UEFI Menu : Go to Motherboard UEFI Menu -> Boot Maintenance Manager -> Boot From File -> Select Linux from 2 (Linux and Windows) ESP partitions -> Choose Path "EFI/Fedora/grubx64.efi"

**Solving problems with UEFI bootloader**

* When you power on your system, your firmware will look for EFI variables that tell it how to boot. On running systems, which have booted into the EFI mode and their EFI runtime services are working correctly, you can configure your boot menu with `efibootmgr`.

* If not, `shim` can help you bootstrap. The EFI program `/boot/efi/EFI/BOOT/fallback.efi` will look for files called `BOOT.CSV` in your ESP and will add boot entries corresponding to them. The `shim` command provides its own `BOOT.CSV` file that will add an entry for `grub2-efi`.

* During the boot process, you can use the EFI Shell to invoke the `fallback.efi` profile to boot the system:

  * `> fs0:` : Enter the boot partition.

  * `> cd EFI\BOOT` : Navigate into the `EFI\BOOT` directory.

  * `> fallback.efi` : Invoke the `fallback.efi` profile.

**More information**

* If you have no boot entries at all, then just booting off your disk in UEFI mode should automatically invoke `/boot/efi/EFI/BOOT/BOOTX64.EFI`, which will, in turn, invoke `fallback.efi`.

* If you already have incorrect boot entries, you’ll either need to delete them or to modify `BOOT.CSV` to create new entries with different names.

## `chroot` bash path issue (Sometimes)

* Error: `chroot: failed to run command '/bin/bash': No such file or directory`
  * This problem occurs, because original `root` partition is not mounted to `/mnt`

**[Reinstall Grub on Fedora from live image](https://unix.stackexchange.com/questions/761571/reinstall-grub-on-fedora-from-live-image) <sup>{8}</sup>**

* Chroot to the broken install: `chroot /mnt/root /usr/bin/bash`

## [How to Resolve the "Temporary failure in name resolution" Error => Internet Issue](https://phoenixnap.com/kb/temporary-failure-in-name-resolution) <sup>{9}</sup>

**Error Details**

* `ping google.com`
```
ping: google.com Temporary failure in name resolution
```
* `ping 8.8.8.8` works [It is Google's IP]

* The "Temporary failure in name resolution" error occurs when the system cannot translate a domain name into an IP address.

**What Does "Temporary failure in name resolution" Mean?**

* The "Temporary failure in name resolution error" is an error that causes network connectivity issues on your system. It can prevent you from installing packages, prevent sending or receiving emails, or result in failed network requests.

* For example, it can occur when using a command such as ping: `ping phoenixnap.com`
  * The system cannot communicate with the DNS server and returns the error:
  ```
  ping: phoenixnap.com: Temporary failure in name resolution
  ```

**"Temporary failure in name resolution" Causes**

* The error can have different causes, and some of the common ones are:
  * No internet connection or a slow one.
  * A badly configured `resolv.conf` network configuration file.
  * A misconfigured firewall application.

**How to Fix "Temporary failure in name resolution"?**

* Solution 1: Check Internet Connection

  * If your other apps don't have internet access, it may be the root of the problem.
  
  * Check the router and make sure all cables are plugged in if you are on LAN. If your other apps have internet access, proceed to the next solution.

* Solution 2: Badly Configured `resolv.conf` File

  * The `resolv.conf` file is a file for configuring DNS servers on Linux systems. Follow the steps below to ensure the file is configured correctly.
  
  * Add a Nameserver
    
    * `sudo nano /etc/resolv.conf` : Open the `resolv.conf` file in a Linux text editor such as nano.

    * `nameserver 8.8.8.8` : Make sure the `resolv.conf` file contains at least one nameserver. The lines listing nameservers should look like this [It is Google's Name Server]

    * Add at least one if you do not have a nameserver listed in the file. `8.8.8.8` and `8.8.4.4` are the popular nameservers owned by Google, but you can add any [functional DNS server](https://phoenixnap.com/kb/dns-server) to this list.

    * Save the file and exit.

    * `sudo systemctl restart systemd-resolved.service` : Next, restart the [DNS resolver](https://phoenixnap.com/glossary/dns-resolver) service. Run the following command
      * If successful, the command above returns no output.

    * `ping phoenixnap.com` : Test that your new nameservers are correctly configured by pinging a website
      * If you see the ping command transmitting and receiving data, your DNS server is working properly.

**Misconfigured Permissions**

* If your resolv.conf file contains valid DNS servers, but the error persists, it may be due to misconfigured [file permissions](https://phoenixnap.com/kb/linux-file-permissions). Follow the steps below to ensure the permissions are set correctly

* `sudo chown root:root /etc/resolv.conf` : Change the ownership of the file to the root user with the following command

* `sudo chmod 644 /etc/resolv.conf` : [Modify the user permissions](https://phoenixnap.com/kb/chmod-recursive) to allow everybody on the system to read the file

* `ping phoenixnap.com` : Ping a website again.
  * If the wrong file permissions caused the error, the commands above successfully resolve it.

**Solution 3: Firewall Restrictions**

* Another reason for the "Temporary failure in name resolution" error may be a firewall blocking one or both of the following ports:
  * Port 43, used for whois lookup.
  * Port 53, used for domain name resolution.

* Open Ports in UFW Firewall
  
  * Follow the steps below if you use [UFW firewall](https://phoenixnap.com/kb/configure-firewall-with-ufw-on-ubuntu):
  
  * `sudo ufw allow 43/tcp` : Run the following command to [open port](https://phoenixnap.com/kb/linux-how-to-open-a-port) 43
  
  * UFW confirms the rule is successfully updated.
  ```
  Rules updated
  Rules updated (v6)
  ```

  * `sudo ufw allow 53/tcp` : Repeat the command for port 53.

  * `sudo ufw reload` : Reload UFW by running the following command

  * The output confirms the operation was successful.
  ```
  Firewall reloaded
  ```

* Open Ports in firewalld

  * Some Linux distributions use firewalld as their default firewall. Follow the steps below to open the ports if you [use firewalld](https://phoenixnap.com/kb/how-to-enable-and-use-firewalld-centos):

  * `sudo firewall-cmd --add-port=43/tcp --permanent` : Run the following command to open port 43 in `firewalld`

  * firewalld outputs the word `success`.

  * `sudo firewall-cmd --add-port=53/tcp --permanent` : Repeat the command for port 53.

  * `sudo firewall-cmd --reload` : Reload the firewall.
    * Output : `success`

  * `ping phoenixnap.com` : Test the connection by pinging a website.

* Note: Check out our post on [DNS troubleshooting](https://phoenixnap.com/kb/dns-troubleshooting) as well.

* Learn more about diagnosing DNS-related problems by reading our article on [how to use Linux dig command](https://phoenixnap.com/kb/linux-dig-command-examples).



## Fedora Emergency Mode

**Error Details**

* Delete fedora `ESP` partition 600 MiB -> Create `fat32` partition 600 MiB -> Repair GRUB using official docs <sup>{1}</sup> -> From motherboard UEFI menu, "Boot From File" -> Shows Error
```
You are in emergency mode. After logging in, type "journalctl -xb" to view system logs, "systemctl reboot" to reboot, or "exit" to continue bootup.

Cannot open access to console, the root account is locked.
See sulogin(8) man page for more details.

Press Enter to continue.
```

* This problem occurs, because `/dev/sda` partitions name/number and `UUID` changed, which does not match with `UUID` in `/etc/fstab` <sup>{4}</sup>

**[How to get your Linux system out of emergency mode BY Mike's Tech Tips](https://www.youtube.com/watch?v=-2wca_0CpXY) <sup>{11}</sup>**

* When GRUB menu is shown, then press `e` to edit the commands before booting
  * or press `c` for a command-line (GRUB)

* Original boot commands (press `e`), Fedora-LXQt-41
```
load_video
set gfxpayload=keep
insmod gzio
linux ($root)/vmlinuz-6.11.4-301.fc41.x86_64 root=UUID=187264ed-7fd2-4a40-bb25-cf5a3ba2705e ro resume=UUID=7qd84204-4w93-5ys2-hh85-73es85tvd95e rhgb quiet
initrd ($root)/initramfs-6.11.4-301.fc41.x86_64.img
```

* Change boot commands (press `e`), Fedora-LXQt-41
```
linux ($root)/vmlinuz-6.11.4-301.fc41.x86_64 root=UUID=187264ed-7fd2-4a40-bb25-cf5a3ba2705e rw resume=UUID=7qd84204-4w93-5ys2-hh85-73es85tvd95e rhgb quiet init=/bin/bash
```
  * Changed `ro` (read-only) to `rw` (read-write), otherwise `/etc/fstab` file will not be writeable <sup>{3}</sup>
  * Add `init=/bin/bash` to start bash shell

**[How To Use UUID To Mount Partitions / Volumes Under Ubuntu Linux](https://www.cyberciti.biz/faq/linux-finding-using-uuids-to-update-fstab/) <sup>{12}</sup>**

* Use UUID, instead of device name `/dev/sdb2`, because UUID does not change upon HDD add/remove.

* `lsblk` : See partition name/number. Get information about block device.

* `sudo blkid /dev/sdb2` : Shows UUID of `/dev/sdb2`

* `sudo cp /etc/fstab /etc/fstab.backup` : At first, make backup of `/etc/fstab` file using `cp` command

* `sudo blkid /dev/sdb2 >> /etc/fstab` : By appending, copy and write into `/etc/fstab` file, using `nano` editor (use `Shift+Arrow` to mark text)

* Reboot PC

# References

* next-sl: {13}

## Tutorials

* Partition
  * {6} [Creating an EFI System Partition](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#create-an-esp)
  * {12} [How To Use UUID To Mount Partitions / Volumes Under Ubuntu Linux](https://www.cyberciti.biz/faq/linux-finding-using-uuids-to-update-fstab/)

* UEFI Motherboard
  * {7} [Solving problems with UEFI bootloader](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#solving-problems-with-uefi-bootloader)

* Repair GRUB
  * {1} [Restoring the bootloader using the Live disk](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#_restoring_the_bootloader_using_the_live_disk)

* `/etc/fstab` file
  * {2} [fstab => ArchLinux Wiki](https://wiki.archlinux.org/title/Fstab)

* Windows-OS
  * {5} [Partitions on the disk are not in the correct order when attempting dual boot installation](https://answers.microsoft.com/en-us/windows/forum/all/partitions-on-the-disk-are-not-in-the-correct/d09936f5-5581-4036-8b00-d794dfa0415c)

* Internet
  * {9} [How to Resolve the "Temporary failure in name resolution" Error](https://phoenixnap.com/kb/temporary-failure-in-name-resolution)

## Guides

* Repair GRUB
  * {3} [How to edit /etc/fstab when system boots to read only file system?](https://unix.stackexchange.com/questions/185026/how-to-edit-etc-fstab-when-system-boots-to-read-only-file-system)
  * {4} [Ubuntu 18.04 can't boot (emergency mode)](https://askubuntu.com/questions/1098434/ubuntu-18-04-cant-boot-emergency-mode)
  * {8} [Reinstall Grub on Fedora from live image](https://unix.stackexchange.com/questions/761571/reinstall-grub-on-fedora-from-live-image)

* Internet
  * {10} [No internet connection in chroot environment (customizing iso)](https://unix.stackexchange.com/questions/481860/no-internet-connection-in-chroot-environment-customizing-iso)

## YouTube Tutorials

* Repair GRUB
  * {11} [How to get your Linux system out of emergency mode BY Mike's Tech Tips](https://www.youtube.com/watch?v=-2wca_0CpXY)
