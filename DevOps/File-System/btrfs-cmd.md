# Commands/Usage

# Btrfs.md

## Notes

* GRUB btrfs.mod driver, unlike ext4, is read-only. <sup>{8}</sup>

* Btrfs does all works inside subvolume <sup>{1} {2}</sup>

* Btrfs is not stable for RAID storage <sup>{1}</sup>

* Fedora also creates a [SwapOnZRAM](https://fedoraproject.org/wiki/Changes/SwapOnZRAM) during boot, so no separate swap partition is required. <sup>{8}</sup>

* For LXQt desktop environment, display manager is `/var/lib/sddm` <sup>{8} {20}</sup>

* The filesystem root always has the subvolume name / and the subvolume ID 5. That is right, even the root of a Btrfs filesystem is technically a subvolume. This is just implicitly known, hence it doesn’t show up in the output of btrfs subvolume list. If you mount a Btrfs filesystem without the subvol or subvolid argument, the root subvolume with subvolid=5 is assumed as default. <sup>{35}</sup>

* If you find it confusing to tell which directories are plain directories and which are subvolumes, you can feel free to adopt a special naming convention for your subvolumes. For example, you could prefix your subvolume names with an “@” to make them easily distinguishable. <sup>{35}</sup>

## PATH

**Snapper**

* Snapper configurations are saved under the `/etc/snapper/configs` directory. <sup>{71}</sup>

## Advantage and Disadvantage

* Advantage
  * Built-in snapshot capability, without much storage. <sup>{72}</sup>

* Disadvantage
  * Fragmentation. "ext4" file system does not have this issue. <sup>{72}</sup>

# References

* next-sl: {73}

## Websites

* {21} [Antynea/grub-btrfs GitHub](https://github.com/Antynea/grub-btrfs) <sup>{7} {8}</sup>

* Btrfs Tools
  * {22} [Snapper => Linux file system snapshot management](http://snapper.io/) || [openSUSE/snapper GitHub](https://github.com/openSUSE/snapper)
  * {23} [ricardomv/snapper-gui GitHub](https://github.com/ricardomv/snapper-gui)
  * {24} [Btrfs Assistant/Btrfs Assistant GitLab](https://gitlab.com/btrfs-assistant/btrfs-assistant)
  * {25} [Garuda Linux/Applications/Snapper Tools GitLab](https://gitlab.com/garuda-linux/applications/snapper-tools)

* Windows-OS Btrfs
  * {26} [maharmstone/btrfs GitHub](https://github.com/maharmstone/btrfs)
  * {27} [maharmstone/ntfs2btrfs GitHub](https://github.com/maharmstone/ntfs2btrfs)
  * {28} [maharmstone/quibble GitHub](https://github.com/maharmstone/quibble)

* Document
  * [Btrfs Official Documentation](https://btrfs.readthedocs.io/en/latest/)

## Commands

* {29} [cheat.sh/btrfs](https://cheat.sh/btrfs)
* {30} [btrfs - topics about the BTRFS filesystem (mount options, supported file attributes and other)](https://man.archlinux.org/man/btrfs.5)
* {31} [mkfs.btrfs - create a btrfs filesystem](https://man.archlinux.org/man/mkfs.btrfs.8)
* {32} [btrfs-check - check or repair a btrfs filesystem](https://man.archlinux.org/man/btrfs-check.8)

* Examples
  * {33} [“btrfs” command examples to Create and Manage Btrfs File System](https://www.ucartz.com/clients/knowledgebase/1250/btrfs-command-examples-to-Create-and-Manage-Btrfs-File-System.html)

## Tutorials

* General
  * {2} [BTRFS Guide - Basic Commands, Snapshots, and RAID](https://christitus.com/btrfs-guide/) <sup>{1}</sup>
  * {5} [Btrfs => ArchLinux Wiki](https://wiki.archlinux.org/title/Btrfs)
  * [Changes/BtrfsByDefault => Fedora](https://fedoraproject.org/wiki/Changes/BtrfsByDefault#Benefit_to_Fedora)

* [Fedora Magazine Series](https://fedoramagazine.org/)
  * {34} [Working with Btrfs – General Concepts](https://fedoramagazine.org/working-with-btrfs-general-concepts/)
  * {35} [Working with Btrfs – Subvolumes](https://fedoramagazine.org/working-with-btrfs-subvolumes/)
  * {36} [Working with Btrfs – Snapshots](https://fedoramagazine.org/working-with-btrfs-snapshots/)
  * {37} [Working with Btrfs – Compression](https://fedoramagazine.org/working-with-btrfs-compression/)

* Comparison
  * {3} [How to create snapshots on Linux => Btrfs vs LVM with commands](https://linuxconfig.org/how-to-create-snapshots-on-linux)

* Fedora: Install/Snapshot
  * {8} [How to Install Fedora 41 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-41-with-snapshot-and-rollback-support) <sup>{7}</sup>
  * {10} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support](https://sysguides.com/install-fedora-41-with-full-disk-encryption-snapshot-and-rollback-support) <sup>{9}</sup>
  * {38} [How to Install Fedora 40 with Snapshot and Rollback Support => Similarity with {8}, plus Snapper test](https://sysguides.com/install-fedora-with-snapshot-and-rollback-support) <sup>{8} {16}</sup>
  * {39} [How to Install Fedora 40 with LUKS Full Disk Encryption, Snapshot, and Rollback Support => Similarity with {10}, plus Snapper test](https://sysguides.com/install-fedora-with-luks-fde-snapshot-rollback-support) <sup>{10} {16}</sup>

* Debian: Install/Snapshot
  * {6} [Installing Debian with BTRFS, Snapper backups and GRUB-BTRFS](https://medium.com/@inatagan/installing-debian-with-btrfs-snapper-backups-and-grub-btrfs-27212644175f)

* Arch: Install/Snapshot
  * {40} [Installing Arch Linux with BTRFS and Disk Encryption](https://itsfoss.com/arch-linux-install-encrypted-btrfs/)
  * {41} [Snapper and grub-btrfs in Arch Linux](https://www.lorenzobettini.it/2023/03/snapper-and-grub-btrfs-in-arch-linux/)

* Snapper
  * {71} [How to manage snapshots with Snapper on Linux](https://linuxconfig.org/how-to-manage-snapshots-with-snapper-on-linux)
  * {42} [Snapper => ArchLinux Wiki](https://wiki.archlinux.org/title/Snapper)

* Others
  * {43} [Desktop environment => ArchLinux Wiki](https://wiki.archlinux.org/title/Desktop_environment) <sup>{8}</sup>
  * {20} [LXQt => ArchLinux Wiki](https://wiki.archlinux.org/title/LXQt)

* Resize Btrfs Filesystem
  * {44} [How add more space in a Btrfs Filesystem, How add a new partition, How add a new disk, Linux](https://discussion.fedoraproject.org/t/how-add-more-space-in-a-btrfs-filesystem-how-add-a-new-partition-how-add-a-new-disk-linux/67595)
    * {45} [How to resize/extend a btrfs formatted root partition](https://www.suse.com/support/kb/doc/?id=000018798)
    * {46} [Resize a Btrfs Filesystem](https://linuxhint.com/resize_a_btrfs_filesystem/)

* [Linux Hint](https://linuxhint.com/)
  * {47} [Introduction to Btrfs Filesystem](https://linuxhint.com/btrfs-filesystem-beginner-guide/)
  * {48} [Pros and Cons of Using btrfs Filesystem in Linux](https://linuxhint.com/pros-cons-btrfs-file-system-linux/)
  * {49} [How to Use Btrfs Snapshots](https://linuxhint.com/use-btrfs-snapshots/)
  * {50} [Btrfs utility examples](https://linuxhint.com/btrfs-utility-examples/)
  * {51} [Resize a Btrfs Filesystem](https://linuxhint.com/resize_a_btrfs_filesystem/)
  * {52} [How to Save Disk Space using Btrfs Deduplication](https://linuxhint.com/save-disk-space-btrfs-deduplication/)
  * {53} [How to Backup Btrfs Snapshots to External Drives](https://linuxhint.com/back_up_btrfs_snapshots_external_drives/)
  * {54} [How to Use Btrfs Balance?](https://linuxhint.com/how-to-use-btrfs-balance/)
  * {55} [How to Use Btrfs Scrub?](https://linuxhint.com/how-to-use-btrfs-scrub/)
  * {56} [How to Set Up Btrfs RAID](https://linuxhint.com/set-up-btrfs-raid/)
  * {57} [How to Defragment a Btrfs Filesystem](https://linuxhint.com/defragment-btrfs-filesystem/)
  * {58} [How to Encrypt a Btrfs Filesystem?](https://linuxhint.com/encrypt-a-btrfs-filesystem/)
  * {59} [How to Enable Btrfs Filesystem Compression](https://linuxhint.com/enable-btrfs-filesystem-compression/)
  * {60} [Useful Mount Options of the Btrfs Filesystem](https://linuxhint.com/btrfs-filesystem-mount-options/)
  * {61} [How to Create and Mount Btrfs Subvolumes](https://linuxhint.com/create-mount-btrfs-subvolumes/)
  * {62} [The Comparison of Btrfs vs Ext4 Filesystems](https://linuxhint.com/btrfs-vs-ext4-filesystems-comparison/)
  * {63} [Install and Use Btrfs on Fedora 33](https://linuxhint.com/install-and-use-btrfs-on-fedora33/)
  * {64} [How to Use Btrfs on Synology NAS?](https://linuxhint.com/use-btrfs-on-synology-nas/)
  * {65} [Btrfs Subvolume Layout for VMs and Databases](https://linuxhint.com/btrfs-subvolume-layout-vms-databases/)
  * {66} [Install and Use Btrfs on Ubuntu 20.04 LTS](https://linuxhint.com/install-and-use-btrfs-on-ubuntu-lts/)
  * {67} [BTRFS Balance Bug in Kernel 5.14.x](https://linuxhint.com/btrfs-balance-bug-kernel-5-14/)

## Guides

* Btrfs
  * {72} [Pros and Cons of Using Btrfs Filesystem in Linux](https://itsfoss.com/btrfs/)

* Comparison
  
  * {11} [Choose between Btrfs and LVM-ext4](https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/)
  * {12} [Putting BTRFS on LVM in Linux](https://www.baeldung.com/linux/btrfs-lvm)
  * {13} [LVM or btrfs](https://www.linuxquestions.org/questions/linux-newbie-8/lvm-or-btrfs-4175723711/)
  * {14} [What's the difference between Rsync & BTRFS Snapshots](https://askubuntu.com/questions/1143954/whats-the-difference-between-rsync-btrfs-snapshots)

* `/boot`
  * {68} [Are there any drawbacks to installing /boot on btrfs?](https://www.reddit.com/r/btrfs/comments/ofm6sl/are_there_any_drawbacks_to_installing_boot_on/)

## YouTube Tutorials

* General
  * {1} [BTRFS Guide | The Best Desktop File System BY Chris Titus Tech](https://www.youtube.com/watch?v=J2QP4onqJKI)
  * {15} [Modernize your Linux Storage with btrfs! BY Learn Linux TV](https://www.youtube.com/watch?v=RPO-fS6HQbY)
  * {69} [Mastering BTRFS: Install, Setup, Subvolumes, Snapshots, Replication and more BY DJ Ware](https://www.youtube.com/watch?v=71AnM15TDYw)

* Fedora: Install/Snapshot
  * {7} [How to Install Fedora 41 with Snapshot and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LwM3wUXJyU8)
  * {9} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support BY SysGuides](https://www.youtube.com/watch?v=LT8gDWEaG4o)
  * {16} [Fedora Snapper Tests: Create, Delete, Compare, Revert, and Rollback Snapshots BY SysGuides](https://www.youtube.com/watch?v=hlAgYA4mVvs)
  * {17} [Installing Fedora with Timeshift compatible encrypted BTRFS Snapshots - Easy GUI Method! BY FOSS World](https://www.youtube.com/watch?v=bN8gGoBaZ5M)
  
* Debian: Install/Snapshot
  * {18} [Debian Testing + BTRFS + Timeshift + Cinnamon BY JustAGuy Linux](https://www.youtube.com/watch?v=IdqkjpsyUNg)

* Ubuntu: Install/Snapshot
  * {19} [Ubuntu: BTRFS & Snapshots BY EF - Linux Made Simple](https://www.youtube.com/watch?v=_sLSiL3oynk)

* Timeshift
  * {70} [System Recovery with Timeshift and Snapshots BY EF - Linux Made Simple](https://www.youtube.com/watch?v=-s872is2-As)
