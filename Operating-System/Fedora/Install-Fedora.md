# Install-Fedora.md

## Notes

* Fedora uses `Anaconda Installer` for operating system installation.

# User

## Fedora Install : USER SETTINGS -> Root Account

* Check "Disable root account"

* General/Administrator account will be used for `sudo` permission

## Fedora Install : USER SETTINGS -> User Creation

* Shows Message : Administrator `{{user-name}}` will be created

# Partition

## Notes

* On Legacy-BIOS/MBR, GRUB2 is installed on device `sda` level, not on partition `sda1` level. Separate `/boot` partition is must for GRUB repair/reinstall.

## (Important) Fedora Install : Creating Custom Partition

* During partition deletion, confirmation dialog is shown
```
Are you sure you want to delete all the data on sda4?

Checkbox "Delete all file systems which are only used by Unknown"
```
**DO NOT CHECK "Delete all file systems which are only used by Unknown". IT WILL DELETE ALL `NTFS` PARTITION.**

## UEFI Custom Partition

**Fedora Installer -> "Installation Destination" -> "Storage Configuration" : "Custom"**

* New Fedora 41 Installation

* You haven't created any mount points for your Fedora 41 installation yet. You can:
  * Click here to create them automatically

* Create new mount points by clicking the '+' button

* Or, assign new mount points to existing partitions after selecting them below.

* New mount points will use the following partitioning scheme: "Btrfs" (Other options: "Standard Partition", "Btrfs", "LVM", "LVM Thin Provisioning")

* Encrypt automatically created mount points by default: Unchecked "Encrypt my data"

**"Click here to create them automatically" (You haven't created any mount points for your Fedora 41 installation yet. You can:)**

* DATA

  * `/home` (home) : All remaining space (GiB) [Optional, Not Required]
    * Mount Point: /home; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: All Remaining Space (GiB); Device Type: Btrfs; Unchecked "Encrypt"; Volume: fedora; File System: btrfs; Checked "Reformat"; Label: <empty>; Name: home

  * `btrfs` (fedora) : All remaining space (GiB) [Optional, Not Required]]
    * Mount Point: <empty>; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: All Remaining Space (GiB); Device Type: Btrfs; Unchecked "Encrypt"; Volume: fedora; File System: btrfs; Checked "Reformat"; Label: fedora; Name: fedora

* SYSTEM

  * `/` (root) : All remaining space (GiB) [Must]
    * Mount Point: /; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: All Remaining Space (GiB); Device Type: Btrfs; Unchecked "Encrypt"; Volume: fedora; File System: btrfs; Checked "Reformat"; Label: <empty>; Name: root; [Flags: <empty>]

  * `/boot/efi` (sda1) : 600 MiB [Must] [Only on UEFI, Not Legacy BIOS] [Must for GRUB repair/reinstall]
    * Mount Point: /boot/efi; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: 600 MiB; Device Type: Standard Partition; Unchecked "Encrypt"; File System: EFI System Partition; Unchecked "Reformat"; Label: <empty>; Name: sda1; [Flags: boot, esp]

  * `/boot` (sda2) : 1024 MiB [Must] [Must for GRUB repair/reinstall]
    * Mount Point: /boot; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: 1024 MiB; Device Type: Standard Partition; Unchecked "Encrypt"; File System: ext4; Checked "Reformat"; Label: <empty>; Name: sda2; [Flags: bls_boot]

**Create Manual Partition**

* `swap` (fedora-swap) : 8 GiB [Optional, Better for Low-RAM PC]
  * Mount Point: ; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: 8 GiB; Device Type: LVM (Default) (Option: Standard Partition); Unchecked "Encrypt"; Volume Group: fedora; File System: swap; Checked "Reformat"; Label: <empty>; Name: swap; [Flags: swap]

* `/` (fedora-root) : Leave empty to get all remaining space (OR enter larger value than available space) [Must]
  * Mount Point: /; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: Remaining Space; Device Type: LVM Thin Provisioning (Default) (Option: Standard Partition); Unchecked "Encrypt"; Volume Group: fedora; File System: ext4; Checked "Reformat"; Label: <empty>; Name: root; [Flags: <empty>]

## Legacy BIOS Custom Partition

**Fedora Installer -> "Installation Destination" -> "Storage Configuration" : "Custom"**

* New Fedora 41 Installation

* You haven't created any mount points for your Fedora 41 installation yet. You can:
  * Click here to create them automatically

* Create new mount points by clicking the '+' button

* New mount points will use the following partitioning scheme: "Btrfs" (Other options: "Standard Partition", "Btrfs", "LVM", "LVM Thin Provisioning")

* Encrypt automatically created mount points by default: Unchecked "Encrypt my data"

**"Click here to create them automatically" (You haven't created any mount points for your Fedora 41 installation yet. You can:)**

* DATA

  * `/home` (home) : All remaining space (GiB) [Optional, Not Required]
    * Mount Point: /home; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: All Remaining Space (GiB); Device Type: Btrfs; Unchecked "Encrypt"; Volume: fedora; File System: btrfs; Checked "Reformat"; Label: <empty>; Name: home

  * `btrfs` (fedora) : All remaining space (GiB) [Optional, Not Required]
    * Mount Point: <empty>; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: All Remaining Space (GiB); Device Type: Btrfs; Unchecked "Encrypt"; Volume: fedora; File System: btrfs; Checked "Reformat"; Label: fedora; Name: fedora

* SYSTEM

  * `/` (root) : All remaining space (GiB) [Must]
    * Mount Point: /; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: All Remaining Space (GiB); Device Type: Btrfs; Unchecked "Encrypt"; Volume: fedora; File System: btrfs; Checked "Reformat"; Label: <empty>; Name: root; [Flags: <empty>]

  * `/boot` (sda2) : 1024 MiB [Must] [Must for GRUB repair/reinstall]
    * Mount Point: /boot; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: 1024 MiB; Device Type: Standard Partition; Unchecked "Encrypt"; File System: ext4; Checked "Reformat"; Label: <empty>; Name: sda2; [Flags: <empty>]

  * `BIOS Boot` (sda1) : 1024 KiB [Optional, Not Required]
    * Mount Point: <empty>; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: 1024 KiB; Device Type: Standard Partition; Unchecked "Encrypt"; File System: BIOS Boot; Checked "Reformat"; Label: <empty>; Name: sda1

**Create Manual Partition**

* `swap` (fedora-swap) : 8 GiB [Optional, Better for Low-RAM PC]
  * Mount Point: ; Device(s): ATA VBOX HARDDISK (sda); Desired Capacity: 8 GiB; Device Type: LVM (Default) (Option: Standard Partition); Unchecked "Encrypt"; Volume Group: fedora; File System: swap; Checked "Reformat"; Label: <empty>; Name: swap; [Flags: swap]

# References

* next-sl: {10}

## Websites

* {1} [fedoraproject.org](https://fedoraproject.org/)
* {2} [Fedora All Releases](https://dl.fedoraproject.org/pub/fedora/linux/releases/)
* {3} [Fedora Old Releases](https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/)

## Tutorials

* Documentation
  * {6} [Fedora Quick Docs](https://docs.fedoraproject.org/en-US/quick-docs/)
  * {7} [Fedora Linux Releases](https://docs.fedoraproject.org/en-US/releases/)

* Installation
  * {5} [Learning about Partitions and How to Create Them for Fedora](https://fedoramagazine.org/learning-about-partitions-and-how-to-create-them-for-fedora/) <sup>{4}</sup>

## YouTube Tutorials

* Installation
  * {4} [The Anaconda Installer BY EF - Linux Made Simple](https://www.youtube.com/watch?v=euzxE-7TL6A)
  * {8} [Dual Boot Fedora & Windows 11 on One PC: Easy Guide BY Learn Linux TV](https://www.youtube.com/watch?v=Asyp7UTCtXs)
  * {9} [How to Dual Boot Fedora Linux and Windows 11 BY TechHut](https://www.youtube.com/watch?v=VaIgbTOvAd0)
