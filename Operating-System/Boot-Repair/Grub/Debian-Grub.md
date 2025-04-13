# Debian-GRUB.md

## Websites

* [Grub2/Installing](https://help.ubuntu.com/community/Grub2/Installing)

# Debian & Windows Dual Boot : Grub Rapair/Reinstall

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

* In dual boot (debian & windows), this happens because there are two `ESP` (EFI System Partition) partitions, with "File System"=`fat32`, Flags=`boot, esp`

* Deleting debian's `ESP` partition, solves the problem

* First delete debian's `ESP` partition, then create windows-os partition. Otherwise above error is shown.

* Make windows partition 600 MiB less, which is for debian's `ESP` partition.

* Windows will create three partition - EFI partition (100 MB), Reserved partition (16 MB), `C` drive partition.

* Partition List

  * Windows EFI Partition (100 MB) : "File System"=`fat32`, Flags=`boot, esp, no_automount`

  * Microsoft reserved partition (16 MB) : "File System"=`unknown`, Flags=`msftres, no_automount`

  * Fedora EFI Partition (600 MiB) : "File System"=`fat32`, Flags=`boot, esp`

**Information**

* [Partitions on the disk are not in the correct order when attempting dual boot installation](https://answers.microsoft.com/en-us/windows/forum/all/partitions-on-the-disk-are-not-in-the-correct/d09936f5-5581-4036-8b00-d794dfa0415c) <sup>{5}</sup>

* Boot Repair Disk Message (Debian LXQt 12.9.0)

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

## [GrubEFIReinstall](https://wiki.debian.org/GrubEFIReinstall) <sup>{13}</sup>

* To reinstall grub, you need either a live CD/USB to access your current system, or you can use the rEFInd boot manager on a live CD/USB to boot your current system.

**Using A Live CD/USB To Fix Your Current System**

* (The following procedure is described in greater detail [here](https://help.ubuntu.com/community/Grub2/Installing#via_ChRoot).)

* Boot (using UEFI) into a live system, such as a [DebianLive](https://wiki.debian.org/DebianLive) CD/USB or the [Debian installer in rescue mode](https://wiki.debian.org/DebianInstaller/Rescue). You can verify that the system has booted using UEFI by checking for the existence of the directory `/sys/firmware/efi` or by running `efibootmgr`.

* If the directory `/sys/firmware/efi/efivars` is empty, you need to boot the rescue system including the kernel option "efi=runtime" and mount the EFI variables before proceeding: `# mount -t efivarfs none /sys/firmware/efi/efivars`

* Mount the broken system somewhere into the running filesystem. The exact details of how to do this depend on the particulars of your installation. The [RescueLive](https://wiki.debian.org/RescueLive) page describes quite similar procedure in a bit different words (mounting `/sys/firmware/efi/efivars` is omitted there, but it adds `/etc/resolv.conf` for updating packages from a network mirror).

* For example, for a system with an EFI partition on `/dev/sdb1`, an unencrypted /boot partition on `/dev/sdb2`, and an unencrypted `/` partition on `/dev/sdb3`, do:

```
# mount /dev/sdb3 /mnt
# mount /dev/sdb2 /mnt/boot
# mount /dev/sdb1 /mnt/boot/efi
```

* Another example - for a system with an EFI partition on `/dev/sdb1` and `/` partition on `/dev/sdb2`, do:

```
# mount /dev/sdb2 /mnt/
# mount /dev/sdb1 /mnt/boot/efi
```

* In case of a LUKS-encrypted / partition, please follow this guide: [GrubEFIReinstallOnLUKS](https://wiki.debian.org/GrubEFIReinstallOnLUKS).

* Bind mount various virtual filesystems:

```
# for i in /dev /dev/pts /proc /sys /sys/firmware/efi/efivars /run; do mount -B $i /mnt/$i; done
```
  * The mount executable supplied with busybox does not support the `-B` option, use `"mount -o bind"` in this case.

* `# chroot /mnt` : Chroot into the broken system

* `# grub-install /dev/sdb` : Reinstall GRUB to the appropriate disk (without partition number)

* `# update-grub` : Generate the GRUB configuration file

* Exit the `chroot` environment (`<CTRL>-D`).

* If everything worked, reboot.

**Using the rEFInd rescue media**

* At the author's web page, http://www.rodsbooks.com/refind/getting.html, you will find updated direct links to all sorts of packaging. To boot from a rescue media, select either the CD ISO image or the image for USB sticks. Most firmware offers the choice nowadays.

* If choosing the latter, make sure to follow the instructions in the README. It is recommended to read the author's web pages to get a better understanding of what you are doing.

**Boot your computer with the Refind media**

* rEFInd will parse your hard drive for installed kernels, and provide you a graphic menu to boot them. Choose your Linux Kernel and boot it.

**Reinstalling grub-efi on your hard drive**

* Check that the computer booted in computer in EFI mode:

```
[ -d /sys/firmware/efi ] && echo "EFI boot on HDD" || echo "Legacy boot on HDD"
should return "EFI boot on HDD".
```

* `mount /dev/sdb1 /boot/efi` : After starting a root shell (if you boot from a live media, you should start a chroot shell instead, as explained [here](https://help.ubuntu.com/community/Grub2/Installing#via_ChRoot)) check that your EFI system partition (most probably `/dev/sdb1`) is mounted on `/boot/efi`. If the `/boot/efi` directory does not exist, you will need to create it.

* `apt-get install --reinstall grub-efi` : Reinstall the grub-efi package

* `grub-install` : Put the Debian bootloader in `/boot/efi` and create an appropriate entry in the computer NVRAM

* `update-grub` : Re create a grub config file based on your disk partitioning schema

* You should check afterwards that:

* Check 1. the bootloader is existing in `/boot/efi/EFI/debian/grubx64.efi`

```
file /boot/efi/EFI/debian/grubx64.efi

/boot/efi/EFI/debian/grubx64.efi: PE32+ executable (EFI application) x86-64 (stripped to external PDB), for MS Windows
```

* Check 2. the NVRAM entry was properly created.

```
efibootmgr --verbose | grep debian
```

* You can now reboot, and Grub should greet you.

**Troubleshooting**

* If after this steps you're not booting, the EFI of your PC might have some bugs.

**Problem1: Weak EFI implementation only recognizes the fallback bootloader**

* The UEFI firmware refuses to boot the debian/grubx64.efi bootloader, and so we have to hijack the UEFI fallback boot loader. See http://mjg59.livejournal.com/138188.html for details.

* Using Debian installer in rescue mode, `/dev/sdb1` being the FAT32 ESP partition, `/dev/sdb2` the root partition

```
mkdir /target
mount /dev/sdb2 /target
mount /dev/sdb1 /target/boot/efi
for i in /sys /proc /dev; do mount --bind $i /target$i; done
chroot /target
```

```
cd /boot/efi/EFI
mkdir boot
cp debian/grubx64.efi boot/bootx64.efi
exit
for i in /sys /proc /dev; do umount /target$i; done
umount /target/boot/efi
umount /target
```

* Once booted into your normal Debian, tell grub to ensure the fallback boot loader up to date. To do that, run the following:

```
echo "grub-efi-amd64 grub2/force_efi_extra_removable boolean true" | sudo debconf-set-selections
```

* Note: The above command will permanently hijack the fallback bootloader, which might be undesirable in dual-boot setups.

**Problem2: EFI boot entries disappear after reboot**

* The UEFI firmware did not create a proper boot entry in NVRAM. This has been seen in a Lenovo Thinkcenter M92Z. The symptom for this will be a missing HD path after the Debian entry in the `efibootmgr --verbose` output.

```
BootCurrent: 0024
Timeout: 0 seconds
BootOrder: 0024,0022,0023,0016,0000,0001
Boot0000* debian        Vendor(99e275e7-75a0-4b37-a2e6-c5385e6c00cb,)
Boot0016* Generic Usb Device    Vendor(99e275e7-75a0-4b37-a2e6-c5385e6c00cb,)
Boot0022* UEFI: IPv4 Intel(R) 82579LM Gigabit Network Connection        ACPI(a0341d0,0)PCI(19,0)MAC(d43d7e6d8bfc,0)IPv4(0.0.0.0:0<->0.0.0.0:0,0, 0AMBO
Boot0023* UEFI: IPv6 Intel(R) 82579LM Gigabit Network Connection        ACPI(a0341d0,0)PCI(19,0)MAC(d43d7e6d8bfc,0)030d3c000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000AMBO
Boot0024* UEFI: Generic Flash Disk 8.00 ACPI(a0341d0,0)PCI(1d,0)USB(1,0)USB(1,0)HD(1,800,2a5f,02f23208-1aa9-4b6c-b6e1-8155390eb9db)AMBO
```

* You can then try to install rEFInd as your bootloader in the hard drive, following the steps at this gist: https://gist.github.com/EmmanuelKasper/9590327.

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

## Debian Stuck During Boot

**Error Details**

* Delete fedora `ESP` partition 600 MiB -> Create `fat32` partition 600 MiB -> Repair GRUB using official docs <sup>{1}</sup> -> From motherboard UEFI menu, "Boot From File" -> Shows Error

```
Debian OS is stucked during boot
```

* This problem occurs, because `/dev/sda` partitions name/number and `UUID` changed, which does not match with `UUID` in `/etc/fstab` <sup>{4}</sup>

**[How to get your Linux system out of emergency mode BY Mike's Tech Tips](https://www.youtube.com/watch?v=-2wca_0CpXY) <sup>{11}</sup>**

* When GRUB menu is shown, then press `e` to edit the commands before booting
  * or press `c` for a command-line (GRUB)

* Original boot commands (press `e`), Debian-LXQt-12.9.0

```
setparams 'Debian GNU/Linux'
  load_video
  insmod gzio
  if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
  insmod part_gpt
  insmod ext2
  set root='hd0,gpt7'
  if [ x$feature_platform_search_hint = xy ]; then
    search --no-floppy --fs-uuid --set=root --hint-bios='hd0,gpt7' --hint-efi=hd0,gpt7 --hint-baremetal=ahci0,gpt7 cbeb6fa9-d6af-478d-bc50-8569c55b2d30
  else
    search --no-floppy --fs-uuid --set=root cbeb6fa9-d6af-478d-bc50-8569c55b2d30
  fi
  echo 'Loading Linux 6.1.0-29-amd64 ...'
  linux /vmlinuz-6.1.0-29-amd64 root=UUID=fa1b69f2-07df-4acf-a142-d5a1bd4a7d43 ro quiet splash resume=UUID=b0666a79-ebc5-48bf-876d-e7c58124e378
  echo 'Loading initial ramdisk ...'
  initrd /initrd.img-6.1.0-29-amd64
```

* Original boot commands (press `e`), Debian-LXQt-12.9.0

```
linux /vmlinuz-6.1.0-29-amd64 root=UUID=fa1b69f2-07df-4acf-a142-d5a1bd4a7d43 rw quiet splash resume=UUID=b0666a79-ebc5-48bf-876d-e7c58124e378 init=/bin/bash
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

* next-sl: {14}

## Tutorials

* Partition
  * {6} [Creating an EFI System Partition](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#create-an-esp)
  * {12} [How To Use UUID To Mount Partitions / Volumes Under Ubuntu Linux](https://www.cyberciti.biz/faq/linux-finding-using-uuids-to-update-fstab/)

* UEFI Motherboard
  * {7} [Solving problems with UEFI bootloader](https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader/#solving-problems-with-uefi-bootloader)

* Repair GRUB
  * {13} [GrubEFIReinstall](https://wiki.debian.org/GrubEFIReinstall)
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

* `/etc/fstab` file
  * [Linux Crash Course - The /etc/fstab file BY Learn Linux TV](https://www.youtube.com/watch?v=A7xH74o6kY0)
