# Btrfs.md

## Notes

* Btrfs does all works inside subvolume <sup>{1} {2}</sup>

* Btrfs is not stable for RAID storage <sup>{1}</sup>

* Fedora also creates a [SwapOnZRAM](https://fedoraproject.org/wiki/Changes/SwapOnZRAM) during boot, so no separate swap partition is required. <sup>{8}</sup>

## Guides

* [Pros and Cons of Using Btrfs Filesystem in Linux](https://itsfoss.com/btrfs/)

## Advantage and Disadvantage

* Advantage
  * Built-in snapshot capability, without much storage.

* Disadvantage
  * Fragmentation. "ext4" file system does not have this issue.

# References

* next-sl: {20}

## Websites

* [Antynea/grub-btrfs GitHub](https://github.com/Antynea/grub-btrfs) <sup>{7} {8}</sup>

* Btrfs Tools
  * [Snapper => Linux file system snapshot management](http://snapper.io/) || [openSUSE/snapper GitHub](https://github.com/openSUSE/snapper)
  * [ricardomv/snapper-gui GitHub](https://github.com/ricardomv/snapper-gui)
  * [Btrfs Assistant/Btrfs Assistant GitLab](https://gitlab.com/btrfs-assistant/btrfs-assistant)
  * [Garuda Linux/Applications/Snapper Tools GitLab](https://gitlab.com/garuda-linux/applications/snapper-tools)

* Windows-OS Btrfs
  * [maharmstone/btrfs GitHub](https://github.com/maharmstone/btrfs)
  * [maharmstone/ntfs2btrfs GitHub](https://github.com/maharmstone/ntfs2btrfs)
  * [maharmstone/quibble GitHub](https://github.com/maharmstone/quibble)

## Commands

* [cheat.sh/btrfs](https://cheat.sh/btrfs)
* [btrfs - topics about the BTRFS filesystem (mount options, supported file attributes and other)](https://man.archlinux.org/man/btrfs.5)
* [mkfs.btrfs - create a btrfs filesystem](https://man.archlinux.org/man/mkfs.btrfs.8)
* [btrfs-check - check or repair a btrfs filesystem](https://man.archlinux.org/man/btrfs-check.8)

## Tutorials

* General
  * {3} [Working with Btrfs – Snapshots](https://fedoramagazine.org/working-with-btrfs-snapshots/)
  * {2} [BTRFS Guide - Basic Commands, Snapshots, and RAID](https://christitus.com/btrfs-guide/) <sup>{1}</sup>
  * {4} [Getting started with btrfs for Linux](https://opensource.com/article/20/11/btrfs-linux)
  * {5} [The Beginner’s Guide to Btrfs](https://www.maketecheasier.com/the-beginners-guide-to-btrfs/)
  * [Btrfs => ArchLinux Wiki](https://wiki.archlinux.org/title/Btrfs)

* Fedora: Install/Snapshot
  * {8} [How to Install Fedora 41 with Snapshot and Rollback Support](https://sysguides.com/install-fedora-41-with-snapshot-and-rollback-support) <sup>{7}</sup>
  * {10} [How to Install Fedora 41 with Full Disk Encryption, Snapshot, and Rollback Support](https://sysguides.com/install-fedora-41-with-full-disk-encryption-snapshot-and-rollback-support) <sup>{9}</sup>
  * [How to Install Fedora 40 with Snapshot and Rollback Support => Similarity with {8}, plus Snapper test](https://sysguides.com/install-fedora-with-snapshot-and-rollback-support) <sup>{8} {16}</sup>
  * [How to Install Fedora 40 with LUKS Full Disk Encryption, Snapshot, and Rollback Support => Similarity with {10}, plus Snapper test](https://sysguides.com/install-fedora-with-luks-fde-snapshot-rollback-support) <sup>{10} {16}</sup>

* Debian: Install/Snapshot
  * {6} [Installing Debian with BTRFS, Snapper backups and GRUB-BTRFS](https://medium.com/@inatagan/installing-debian-with-btrfs-snapper-backups-and-grub-btrfs-27212644175f)

* Arch: Install/Snapshot
  * [Installing Arch Linux with BTRFS and Disk Encryption](https://itsfoss.com/arch-linux-install-encrypted-btrfs/)
  * [Snapper and grub-btrfs in Arch Linux](https://www.lorenzobettini.it/2023/03/snapper-and-grub-btrfs-in-arch-linux/)

* Snapper
  * [Snapper => ArchLinux Wiki](https://wiki.archlinux.org/title/Snapper)

* Others
  * [Desktop environment => ArchLinux Wiki](https://wiki.archlinux.org/title/Desktop_environment) <sup>{8}</sup>
  * [LXQt => ArchLinux Wiki](https://wiki.archlinux.org/title/LXQt)

## Guides

* Comparison
  
  * {11} [Choose between Btrfs and LVM-ext4](https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/)
  * {12} [Putting BTRFS on LVM in Linux](https://www.baeldung.com/linux/btrfs-lvm)
  * {13} [LVM or btrfs](https://www.linuxquestions.org/questions/linux-newbie-8/lvm-or-btrfs-4175723711/)
  * {14} [What's the difference between Rsync & BTRFS Snapshots](https://askubuntu.com/questions/1143954/whats-the-difference-between-rsync-btrfs-snapshots)

* `/boot`
  * [Are there any drawbacks to installing /boot on btrfs?](https://www.reddit.com/r/btrfs/comments/ofm6sl/are_there_any_drawbacks_to_installing_boot_on/)

## YouTube Tutorials

* General
  * {1} [BTRFS Guide | The Best Desktop File System BY Chris Titus Tech](https://www.youtube.com/watch?v=J2QP4onqJKI)
  * {15} [Modernize your Linux Storage with btrfs! BY Learn Linux TV](https://www.youtube.com/watch?v=RPO-fS6HQbY)

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
  * [System Recovery with Timeshift and Snapshots BY EF - Linux Made Simple](https://www.youtube.com/watch?v=-s872is2-As)
